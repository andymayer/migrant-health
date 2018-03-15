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

  def favourites
    if current_user
      @resources = current_user.find_liked_items.select {|i| i.class.ancestors.include? Resource}
    else
      redirect_to new_user_session_path, notice: "You need to be logged in to see favourites"
    end
  end

  def profile
    @user = current_user
  end
end
