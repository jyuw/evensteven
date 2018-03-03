class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params.merge(group_id: params[:group_id]))
    add_current_user_to_expense
    @group = Group.find(params[:group_id])
    all_group_expenses = extract_user_expenses(@group)
    total_amounts_owed = calculate_amounts(all_group_expenses)
    @output = split(all_group_expenses, total_amounts_owed)
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
    output = []

    all_group_expenses.each do |email, amount|
      next if total_amounts_owed[email] == 0
      if amount > @group_average
        lenders << { email => total_amounts_owed[email] }
      else
        debtors << { email => total_amounts_owed[email] }
      end
    end

    lenders.each do |lender|
      # counter = 0
      # until counter >= lenders.length
      if lender.values.first != 0
        debtors.each do |debtor|
          next if lender.values.first == 0 || debtor.values.first == 0

          if (lender.values.first >= debtor.values.first.abs)
            lender[lender.keys.first] = (lender.values.first + debtor.values.first)
            output << "#{debtor.keys.first} owes #{lender.keys.first} #{-(debtor.values.first)}kr"
            debtor[debtor.keys.first] = (debtor.values.first - debtor.values.first)

          elsif (debtor.values.first.abs >= lender.values.first)
            debtor[debtor.keys.first] =  (debtor.values.first + lender.values.first)
            output << "#{debtor.keys.first} owes #{lender.keys.first} #{lender.values.first}kr"
            lender[lender.keys.first] = (lender.values.first - lender.values.first)
          else
            puts "JAjjdäää.. is stone-cold.. OMG"
          end
        end
        # counter += 1
      end
    end
    output
  end
end
