class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params.merge(group_id: params[:group_id]))
    add_current_user_to_expense
    group = Group.find(params[:group_id])
    all_group_expenses = extract_user_expenses(group)
    total_amounts_owed = calculate_amounts(all_group_expenses)
    split(all_group_expenses, total_amounts_owed)
    redirect_to group_path(group)
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
    @group_average = group.values.reduce(:+).fdiv(group.size)
    group.map { |k,v| [k, (v - @group_average).round(2)] }.to_h
  end

  def extract_user_expenses(group)
    total_expenses = {}
    group.expenses.each do |expense|
      key = expense.user.id
      value = expense.amount
      if total_expenses.has_key?(key)
        current_amount = total_expenses.fetch(key)
        current_amount += value
        total_expenses[key] = current_amount
      else
        total_expenses[key] = value
      end
    end
    total_expenses
  end

  def split(all_group_expenses, total_amounts_owed)
    lenders = []
    debtors = []
    all_group_expenses.each do |person, amount|
      binding.pry
      user = User.find_by(id: person).email
      if amount == 0
        return true
      elsif amount > @group_average
        lenders << {user => amount}
      else
        debtors << {user => amount}
      end
    end

    @output = []

    lenders.each do |lender_hash|
      while lender_hash.values != 0
        debtors.each do |debtor_hash|
          if lender_hash.values >= debtor_hash.values.abs
            lender_hash.values -= debtor_hash.values.abs
            output << "#{debtor.hash.key} owes #{lender.hash.key} #{debtor.hash.values}kr"
          elsif debtor_hash.values.abs >= lender_hash.values
            debtor_hash.values += lender_hash.values
            output << "#{debtor.hash.key} owes #{lender.hash.key} #{lender.hash.values}kr"
          else
            return true
          end
        end
      end
    end
    return @output
  end
end
