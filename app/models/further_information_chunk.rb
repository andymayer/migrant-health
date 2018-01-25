# == Schema Information
#
# Table name: further_information_chunks
#
#  id         :integer          not null, primary key
#  title      :text
#  intro      :text
#  after      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FurtherInformationChunk < ApplicationRecord
  has_one   :resource
  has_many  :external_resources
  has_many  :uploaded_attachments

  accepts_nested_attributes_for :external_resources,         reject_if: :all_blank
  accepts_nested_attributes_for :uploaded_attachments,       reject_if: :all_blank

  def uploaded_attachments_with_files
    uploaded_attachments.reject { |uploaded_attachment| uploaded_attachment.uploaded_file_file_size.nil? }
  end
end
