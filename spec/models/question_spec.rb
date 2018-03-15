# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  slug       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :text
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
