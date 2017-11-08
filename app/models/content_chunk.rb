# == Schema Information
#
# Table name: content_chunks
#
#  id         :integer          not null, primary key
#  type       :text
#  title      :text
#  intro      :text
#  content    :text
#  after      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContentChunk < ApplicationRecord
end
