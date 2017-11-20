# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  slug       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  include PgSearch

  belongs_to  :user
  has_many    :answers
  has_many    :comments
  has_many    :votes

  validates_presence_of :content

  multisearchable against: :content

end
