class PracticeExampleToBrightIdea < ActiveRecord::Migration[5.1]
  def change
    r = Resource.find_by_title("Using Pictures To Help Non-English Speakers Understand The Repeat Prescription Process")
    r.type = "Resources::BrightIdea"
    r.save
  end
end
