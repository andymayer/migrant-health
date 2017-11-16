# == Schema Information
#
# Table name: uploaded_attachments
#
#  id                           :integer          not null, primary key
#  uploaded_file_file_name      :string
#  uploaded_file_content_type   :string
#  uploaded_file_file_size      :integer
#  uploaded_file_updated_at     :datetime
#  further_information_chunk_id :integer          not null
#  title                        :text             not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class UploadedAttachment < ApplicationRecord
  belongs_to :further_information_chunk

  has_attached_file :uploaded_file
end
