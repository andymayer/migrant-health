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

  acts_as_url :content, url_attribute: :slug

  acts_as_taggable
  acts_as_taggable_on :topics

  belongs_to  :user
  has_many    :answers
  has_many    :comments
  has_many    :votes

  validates_presence_of :content

  multisearchable against: :content

  def to_param
    slug
  end

end
