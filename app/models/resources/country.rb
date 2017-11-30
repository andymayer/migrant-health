# == Schema Information
#
# Table name: resources
#
#  id                           :integer          not null, primary key
#  type                         :text             not null
#  title                        :text             not null
#  intro                        :text             not null
#  contributed_by               :text             not null
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

module Resources
  class Country < Resource
    belongs_to :resources_chunk,             optional: true, class_name: 'FurtherInformationChunk', foreign_key: 'further_information_chunk_id'

    accepts_nested_attributes_for :resources_chunk,              reject_if: :all_blank

    def icon_file_name
      'icon-country.svg'
    end

    def icon_alt_text
      'Country'
    end
  end
end
