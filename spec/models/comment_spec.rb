# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  question_id :integer
#  answer_id   :integer
#  user_id     :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
