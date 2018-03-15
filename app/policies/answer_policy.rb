class AnswerPolicy < QuestionPolicy
  attr_reader :user, :answer

  def initialize(user, answer)
    @user = user
    @answer = answer
  end

  def show?
    scope.where(:id => answer.id).exists?
  end

  def like?
    user.present? && @answer.user != user
  end

  def unlike?
    user.present? && @answer.user != user
  end

  def update?
    (user.present? && @answer.user == user) || user.try(:admin?)
  end

  def edit?
    (user.present? && @answer.user == user) || user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end

end
