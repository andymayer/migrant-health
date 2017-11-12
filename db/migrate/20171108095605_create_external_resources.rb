class CreateExternalResources < ActiveRecord::Migration[5.1]
  def change
    create_table :external_resources do |t|
      t.text     :title,       null: false
      t.text     :url
      t.text     :size
      t.text     :type
      t.text     :metadata
      t.timestamps
    end
  end
end
