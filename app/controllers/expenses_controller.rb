class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params)
    binding.pry
  end

  private

  def expense_params
    params.permit(:expense[:description], :group)
  end
end
