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

module Resources
  class BrightIdea < Resource

    DISPLAY_TYPE = 'Bright Idea'.freeze

    belongs_to :what_was_the_problem_chunk,   optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_1_id'
    belongs_to :how_did_we_approach_it_chunk, optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_2_id'
    belongs_to :what_did_we_do_chunk,         optional: true, class_name: 'NumberedParagraphChunk', foreign_key: 'content_chunk_3_id'
    belongs_to :did_it_work_chunk,            optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_4_id'
    belongs_to :recommendations_chunk,        optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_5_id'
    belongs_to :attachments_chunk,            optional: true, class_name: 'FurtherInformationChunk', foreign_key: 'further_information_chunk_id'

    accepts_nested_attributes_for :what_was_the_problem_chunk,    reject_if: :all_blank_and_new_record
    accepts_nested_attributes_for :how_did_we_approach_it_chunk,  reject_if: :all_blank_and_new_record
    accepts_nested_attributes_for :what_did_we_do_chunk,          reject_if: :all_blank_and_new_record
    accepts_nested_attributes_for :did_it_work_chunk,             reject_if: :all_blank_and_new_record
    accepts_nested_attributes_for :recommendations_chunk,         reject_if: :all_blank_and_new_record
    accepts_nested_attributes_for :attachments_chunk,         reject_if: :all_blank_and_new_record


    def icon_file_name
      'icon-practice-example.svg'
    end

    def icon_alt_text
      DISPLAY_TYPE
    end

    def self.tagline
      'Highlighting local innovative and good practice'.freeze
    end

  end
end
