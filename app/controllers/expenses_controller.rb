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
    group.expenses.each do |expense|
      key = expense.user.email
      if total_expenses.has_key?(key)
        total_expenses[key] += expense.amount
      else
        total_expenses[key] = expense.amount
      end
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
      counter = 0
      until counter >= lenders.length
        debtors.each do |debtor|
          binding.pry
          if (lender.values[0] >= debtor.values[0].abs) && lender.values[0]!=0 && debtor.values[0]!=0
            lender[lender.keys[0]] = (lender.values[0] - debtor.values[0])
            output << "#{debtor.keys[0]} owes #{lender.keys[0]} #{-(debtor.values[0])}kr"
            debtor[debtor.keys[0]] = (debtor.values[0] - debtor.values[0])

          elsif (debtor.values[0].abs >= lender.values[0]) && debtor.values[0]!=-0.0
            debtor[debtor.keys[0]] =  (debtor.values[0] + lender.values[0])
            output << "#{debtor.keys[0]} owes #{lender.keys[0]} #{lender.values[0]}kr"
            lender[lender.keys[0]] = (lender.values[0] - lender.values[0])
          else
          end
        end
        counter += 1
      end
    end
    output
  end
end
