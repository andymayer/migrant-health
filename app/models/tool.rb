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
#  slug                         :text             not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class Tool < Resource

  belongs_to :explanation_chunk,        optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_1_id'
  belongs_to :where_it_s_from_chunk,    optional: true, class_name: 'ParagraphChunk', foreign_key: 'content_chunk_2_id'
  belongs_to :numbered_paragraph_chunk, optional: true, class_name: 'NumberedParagraphChunk', foreign_key: 'content_chunk_3_id'
  belongs_to :attachments,              optional: true, class_name: 'FurtherInformationChunk', foreign_key: 'further_information_chunk_id'

  accepts_nested_attributes_for :explanation_chunk,         reject_if: :all_blank
  accepts_nested_attributes_for :where_it_s_from_chunk,     reject_if: :all_blank
  accepts_nested_attributes_for :numbered_paragraph_chunk,  reject_if: :all_blank
  accepts_nested_attributes_for :attachments,               reject_if: :all_blank

  def icon_file_name
    'icon-tool.svg'
  end

  def icon_alt_text
    'Tools'
  end
end
