# == Schema Information
#
# Table name: resources
#
#  id                     :integer          not null, primary key
#  type                   :text             not null
#  title                  :text             not null
#  introductory_paragraph :text             not null
#  video_url              :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Resource < ApplicationRecord
end
