# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  answer_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :question,      optional: true
  belongs_to :answer,        optional: true

  # Should be associated with a Question OR an answer
  validates :question,  presence: true, unless: ->(vote){vote.answer.present?}
  validates :answer,    presence: true, unless: ->(vote){vote.question.present?}
end
