class UserPolicy < ApplicationPolicy
  attr_reader :user, :resource

  def initialize(user, user_thing)
    @user = user
    @user_thing = user_thing
  end

  def show?
    scope.where(:id => user_thing.id).exists?
  end

  def index?
    user.try(:admin?)
  end

  def new?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    user.try(:admin?)
  end

end
