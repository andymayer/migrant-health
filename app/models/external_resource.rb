# == Schema Information
#
# Table name: external_resources
#
#  id                           :integer          not null, primary key
#  further_information_chunk_id :integer          not null
#  title                        :text             not null
#  url                          :text             not null
#  size                         :text
#  resource_type                :text
#  metadata                     :text
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class ExternalResource < ApplicationRecord
  belongs_to :further_information_chunk

  before_save { set_resource_type_and_metadata unless url.nil? }

  def icon_file_name
    resource_type == 'html' ? 'icon-link.svg' : 'icon-document.svg'
  end

  # private

  def set_resource_type_and_metadata
    extension = File.extname(url)
    self.resource_type = extension.empty? ? 'html' : 'document'
    begin
      uri = URI.parse(url)
      self.metadata =  uri.host
    rescue
    end
  end
end
