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
end
