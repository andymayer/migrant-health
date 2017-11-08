# == Schema Information
#
# Table name: resources
#
#  id                 :integer          not null, primary key
#  type               :text             not null
#  title              :text             not null
#  intro              :text             not null
#  video_url          :text
#  content_chunk_1_id :integer
#  content_chunk_2_id :integer
#  content_chunk_3_id :integer
#  content_chunk_4_id :integer
#  url                :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class FactSheet < Resource

  belongs_to :numbered_paragraph_chunk, optional: true, class_name: 'NumberedParagraphChunk', foreign_key: 'content_chunk_1_id'

  def icon_file_name
    'icon-fact-sheet.svg'
  end

  def icon_alt_text
    'Fact Sheet'
  end
end
