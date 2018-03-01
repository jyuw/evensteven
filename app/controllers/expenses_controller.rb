class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params.merge(group_id: params[:group_id]))
    add_current_user_to_expense
    group = Group.find(params[:group_id])
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

end
