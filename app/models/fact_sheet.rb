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
#  url                          :text
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class FactSheet < Resource

  belongs_to :numbered_paragraph_chunk,   optional: true, class_name: 'NumberedParagraphChunk', foreign_key: 'content_chunk_1_id'
  belongs_to :indicators_chunk,           optional: true, class_name: 'BulletPointChunk',       foreign_key: 'content_chunk_3_id'
  belongs_to :what_to_do_chunk,           optional: true, class_name: 'BulletPointChunk',       foreign_key: 'content_chunk_4_id'
  belongs_to :further_information_chunk,  optional: true

  accepts_nested_attributes_for :numbered_paragraph_chunk,  reject_if: :all_blank
  accepts_nested_attributes_for :indicators_chunk,          reject_if: :all_blank
  accepts_nested_attributes_for :what_to_do_chunk,          reject_if: :all_blank
  accepts_nested_attributes_for :further_information_chunk, reject_if: :all_blank

  def icon_file_name
    'icon-fact-sheet.svg'
  end

  def icon_alt_text
    'Fact Sheet'
  end
end
