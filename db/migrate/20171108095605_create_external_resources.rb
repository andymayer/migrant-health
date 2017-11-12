class CreateExternalResources < ActiveRecord::Migration[5.1]
  def change
    create_table :external_resources do |t|
      t.integer  :further_information_chunk_id, null: false, index: true, foreign_key: { to_table: :further_information_chunks }
      t.text     :title,                        null: false
      t.text     :url,                          null: false
      t.text     :size
      t.text     :resource_type
      t.text     :metadata
      t.timestamps
    end
  end
end
