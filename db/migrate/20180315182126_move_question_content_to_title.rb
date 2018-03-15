class MoveQuestionContentToTitle < ActiveRecord::Migration[5.1]
  def change
    Question.all.each do |q|
      q.title = q.content.split("?").first+"?"
      q.save
    end
  end
end
