# == Schema Information
#
# Table name: resources
#
#  id                           :integer          not null, primary key
#  type                         :text             not null
#  title                        :text             not null
#  intro                        :text             not null
#  contributed_by               :text
#  video_url                    :text
#  content_chunk_1_id           :integer
#  content_chunk_2_id           :integer
#  content_chunk_3_id           :integer
#  content_chunk_4_id           :integer
#  content_chunk_5_id           :integer
#  content_chunk_6_id           :integer
#  content_chunk_7_id           :integer
#  further_information_chunk_id :integer
#  slug                         :text             not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class Resource < ApplicationRecord
  include PgSearch

  acts_as_votable

  DISPLAY_TYPE = 'Resource'.freeze

  acts_as_url :title, url_attribute: :slug
  acts_as_taggable
  acts_as_taggable_on :topics

  multisearchable against: [:title, :intro]

  validates_presence_of :title, :intro

  def self.tagline
    'Practical guidance about how to deal with specific problems'.freeze
  end

  # Enables pretty urls
  def to_param
    slug
  end

  def icon_alt_text
    DISPLAY_TYPE
  end

  def favourite_message_for_user(user)
    if !user
      ""
    elsif user.voted_up_on?(self)
      liked_message
    else
      not_liked_yet_message
    end
  end

  def liked_message
    "Added to favourites"
  end

  def not_liked_yet_message
    "Add to favourites"
  end

  private

  def all_blank_and_new_record(attributes)
    attributes.all? { |key, value| ( key == "_destroy" || value.blank? ) } && new_record?
  end



end
