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
#  title      :text
#

class Question < ApplicationRecord
  include PgSearch

  AUTHORISATION_MESSAGE = "You need to be registered and logged in to ask or vote for a question.".freeze

  acts_as_url :title, url_attribute: :slug
  acts_as_votable

  acts_as_taggable
  acts_as_taggable_on :topics

  belongs_to  :user
  has_many    :answers
  has_many    :comments
  has_many    :votes

  validates_presence_of :title, { message: ": Please enter the question"}
  validates_presence_of :content, { message: ": Please add more detail about your question"}

  validates_presence_of :topic_list, { message: ": Please choose at least one relevant topic"}

  multisearchable against: :content

  def icon_file_name
    'icon-discussion.svg'
  end

  def icon_alt_text
    'Question'
  end

  def intro
    'Question'
  end

  def to_param
    slug
  end

  def authorisation_message
    AUTHORISATION_MESSAGE
  end

  def self.top
    all.sort_by{|a| -a.weighted_score}.first(10)
  end

  def self.active
    Question.left_joins(:answers).group(:id).order('COUNT(answers.id) DESC').limit(10)
  end

  def self.recent
    Question.order("created_at DESC").first(10)
  end

  def self.open
    Question.includes(:answers).where(answers: { id: nil }).order("questions.created_at ASC").shuffle.first(10)
  end


end
