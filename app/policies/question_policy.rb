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
   user.present?
  end

  def edit?
    user.present?
  end

  def destroy?
    user.present?
  end

  def like?
    user.present?
  end

  def unlike?
    user.present?
  end
end
