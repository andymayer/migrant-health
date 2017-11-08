class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.text        :type,        null: false
      t.text        :title,       null: false
      t.text        :intro,       null: false
      t.text        :video_url
      t.integer     :content_chunk_1_id
      t.integer     :content_chunk_2_id
      t.integer     :content_chunk_3_id
      t.integer     :content_chunk_4_id
      t.text        :url        # For Pretty URLS
      t.timestamps
    end
  end
end
