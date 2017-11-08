# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  type       :text             not null
#  title      :text             not null
#  intro      :text             not null
#  video_url  :text
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe HowTo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
