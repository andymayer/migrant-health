class ResourcePolicy < ApplicationPolicy
  attr_reader :user, :resource

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  def show?
    scope.where(:id => resource.id).exists?
  end

  def create?
    user.try(:admin?)
  end

  def new?
    user.try(:admin?)
  end

  def update?
    user.try(:admin?)
  end

  def edit?
    user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end
end
