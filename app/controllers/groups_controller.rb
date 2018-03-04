class GroupsController < ApplicationController

  def new
    @users_list = User.all.to_a
    @users_list.delete_at(@users_list.index(current_user))
  end

  def create
    params[:users].shift
    @group = Group.new(group_params)
    add_users_to_group
    add_current_user_to_group
    @group.save
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
  end

  def add_current_user_to_group
    @group.users << current_user
  end
end
