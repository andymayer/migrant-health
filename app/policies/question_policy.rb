class QuestionPolicy < ApplicationPolicy
  attr_reader :user, :question

  def initialize(user, question)
    @user = user
    @question = question
  end

  def show?
    scope.where(:id => question.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end

  def update?
    (user.present? && @question.user == user) || user.try(:admin?)
  end

  def edit?
    (user.present? && @question.user == user) || user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end

  def like?
    user.present? && @question.user != user
  end

  def unlike?
    user.present? && @question.user != user
  end
end
