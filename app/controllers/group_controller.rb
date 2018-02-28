class GroupController < ApplicationController
  def new
  end

  def create
    @group = Group.new(group_params)
    @group.save
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  private
  def group_params
    params.permit(:name, :description)
  end
end
