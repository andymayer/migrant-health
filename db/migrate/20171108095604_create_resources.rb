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
      t.integer     :content_chunk_5_id
      t.integer     :content_chunk_6_id
      t.integer     :content_chunk_7_id
      t.integer     :further_information_chunk_id
      t.text        :slug        # For Pretty URLS
      t.timestamps
    end
  end
end
