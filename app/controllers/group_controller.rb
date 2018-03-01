class GroupController < ApplicationController

  def new
  end

  def create
    params[:users].shift
    @group = Group.new(group_params)
    add_current_user_to_group
    add_users_to_group
    @group.save
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  private
  def group_params
    params.permit(:name, :description, :users)
  end

  def add_users_to_group
    params[:users].each do |u|
      user = User.find_by(id: u)
      @group.users << user
    end
  end

  def add_current_user_to_group
    @group.users << current_user
  end

end
