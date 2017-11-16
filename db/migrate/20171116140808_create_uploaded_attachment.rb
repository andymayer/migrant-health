class CreateUploadedAttachment < ActiveRecord::Migration[5.1]
  def change
    create_table :uploaded_attachments do |t|
      t.attachment  :uploaded_file
      t.integer     :further_information_chunk_id, null: false, index: true, foreign_key: { to_table: :further_information_chunks }
      t.text        :title,                        null: false
      t.timestamps
    end
  end
end