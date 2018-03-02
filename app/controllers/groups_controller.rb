class GroupsController < ApplicationController

  def create
    params[:users].shift
    @group = Group.new(group_params)
    add_users_to_group
    redirect_to group_path(@group)
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  private
  def group_params
    params.permit(:name, :description, :users)
  end

  def add_users_to_group
    params[:users].each do |member|
      user = User.find_by(id: member)
      @group.users << user
    end
    @group.users << current_user
    @group.save
  end

end
