class UsersController < ApplicationController

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  def index
    if policy(User).index?
      @users = User.all.order(created_at: :asc)
    else
      not_found
    end
  end
end
