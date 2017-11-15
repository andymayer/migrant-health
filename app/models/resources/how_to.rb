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
  class HowTo < Resource

    belongs_to :before_in_preparation_chunk, optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_1_id'
    belongs_to :during_consultation_chunk,   optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_2_id'
    belongs_to :after_aftercare_chunk,       optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_3_id'
    belongs_to :further_information_chunk,   optional: true

    accepts_nested_attributes_for :before_in_preparation_chunk, reject_if: :all_blank
    accepts_nested_attributes_for :during_consultation_chunk,   reject_if: :all_blank
    accepts_nested_attributes_for :after_aftercare_chunk,       reject_if: :all_blank
    accepts_nested_attributes_for :further_information_chunk,   reject_if: :all_blank

    def icon_file_name
      'icon-how-to.svg'
    end

    def icon_alt_text
      'How To'
    end
  end
end
