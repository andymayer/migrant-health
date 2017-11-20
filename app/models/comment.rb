# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  question_id :integer
#  answer_id   :integer
#  user_id     :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question,      optional: true
  belongs_to :answer,        optional: true

  # Should be associated with a Question OR an answer
  validates :question,  presence: true, unless: ->(comment){comment.answer.present?}
  validates :answer,    presence: true, unless: ->(comment){comment.question.present?}
end
