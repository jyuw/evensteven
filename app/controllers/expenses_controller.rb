class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params.merge(group_id: params[:group_id]))
    add_current_user_to_expense
    @group = Group.find(params[:group_id])
    all_group_expenses = extract_user_expenses(@group)
    total_amounts_owed = calculate_amounts(all_group_expenses)
    output = split(all_group_expenses, total_amounts_owed)
    @group.output = output
    @group.save
    render 'groups/show'
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :amount, :group_id)
  end

  def add_current_user_to_expense
    @expense.user = current_user
    @expense.save
  end

  def calculate_amounts(group)
    @group_average = group.values.reduce(:+).fdiv(@group.users.length)
    group.map {|k, v| [k, (v - @group_average).round(2)]}.to_h
  end

  def extract_user_expenses(group)
    total_expenses = {}
    group.users.each do |user|
      total_expenses[user.email] = 0
    end
    group.expenses.each do |expense|
      total_expenses[expense.user.email] += expense.amount
    end
    total_expenses
  end

  def split(all_group_expenses, total_amounts_owed)
    lenders = []
    debtors = []
    output = ["Total expenses per person: #{@group_average}kr"]

    all_group_expenses.each do |email, amount|
      next if total_amounts_owed[email] == 0
      if amount > @group_average
        lenders << { email => total_amounts_owed[email] }
      else
        debtors << { email => total_amounts_owed[email] }
      end
    end

    lenders.each do |lender|
      if lender.values.first != 0
        debtors.each do |debtor|
          debtor_owes = debtor.values.first
          debtor_email = debtor.keys.first
          lender_owed = lender.values.first
          lender_email = lender.keys.first

          next if lender_owed == 0 || debtor_owes == 0

          if (lender_owed >= debtor_owes.abs)
            lender[lender_email] = (lender_owed + debtor_owes)
            output << "#{debtor_email} owes #{lender_email} #{-(debtor_owes)}kr"
            debtor[debtor_email] = (debtor_owes - debtor_owes)

          else
            debtor[debtor_email] =  (debtor_owes + lender_owed)
            output << "#{debtor_email} owes #{lender_email} #{lender_owed}kr"
            lender[lender_email] = (lender_owed - lender_owed)
          end
        end
      end
    end
    output
  end
end
