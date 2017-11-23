class UsersController < ApplicationController

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.order(created_at: :asc)
  end
end
