class AnswerPolicy < QuestionPolicy
  attr_reader :user, :answer

  def initialize(user, answer)
    @user = user
    @answer = answer
  end

  def show?
    scope.where(:id => answer.id).exists?
  end
end
