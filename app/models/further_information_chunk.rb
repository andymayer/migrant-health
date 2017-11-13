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

  accepts_nested_attributes_for :external_resources,         reject_if: :all_blank
end
