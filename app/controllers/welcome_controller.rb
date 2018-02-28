class WelcomeController < ApplicationController

  def index
    render :dashboard if user_signed_in?
  end

end
