class ExpensesController < ApplicationController
  def create
    binding.pry
    @expense = Expense.new(expense_params)
  end



  private

  def expense_params
    params.premit(:description, :amount, :group)
  end
end
