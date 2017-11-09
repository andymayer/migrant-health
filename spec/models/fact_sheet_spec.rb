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
#  content_chunk_5_id :integer
#  content_chunk_6_id :integer
#  content_chunk_7_id :integer
#  url                :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe FactSheet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
