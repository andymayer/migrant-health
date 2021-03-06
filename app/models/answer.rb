# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :comments

  acts_as_votable

  AUTHORISATION_MESSAGE = "You need to be logged in vote on answers.".freeze

  def authorisation_message
    AUTHORISATION_MESSAGE
  end
end
