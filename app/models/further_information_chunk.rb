# == Schema Information
#
# Table name: further_information_chunks
#
#  id           :integer          not null, primary key
#  title        :text
#  intro        :text
#  info_1_url   :text
#  info_1_title :text
#  info_2_url   :text
#  info_2_title :text
#  info_3_url   :text
#  info_3_title :text
#  info_4_url   :text
#  info_4_title :text
#  info_5_url   :text
#  info_5_title :text
#  info_6_url   :text
#  info_6_title :text
#  after        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FurtherInformationChunk < ApplicationRecord
  has_one   :resource
  has_many  :external_resources
end
