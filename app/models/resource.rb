# == Schema Information
#
# Table name: resources
#
#  id                           :integer          not null, primary key
#  type                         :text             not null
#  title                        :text             not null
#  intro                        :text             not null
#  video_url                    :text
#  content_chunk_1_id           :integer
#  content_chunk_2_id           :integer
#  content_chunk_3_id           :integer
#  content_chunk_4_id           :integer
#  content_chunk_5_id           :integer
#  content_chunk_6_id           :integer
#  content_chunk_7_id           :integer
#  further_information_chunk_id :integer
#  slug                         :text
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class Resource < ApplicationRecord
  include PgSearch

  acts_as_url :title, url_attribute: :slug

  multisearchable against: :title
  multisearchable against: :intro


  # Enables pretty urls
  def to_param
    slug
  end
end
