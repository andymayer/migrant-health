class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.text        :type,            null: false
      t.text        :title,           null: false
      t.text        :intro,           null: false
      t.text        :contributed_by,  null: false
      t.text        :video_url
      t.integer     :content_chunk_1_id, index: true, foreign_key: { to_table: :content_chunks }
      t.integer     :content_chunk_2_id, index: true, foreign_key: { to_table: :content_chunks }
      t.integer     :content_chunk_3_id, index: true, foreign_key: { to_table: :content_chunks }
      t.integer     :content_chunk_4_id, index: true, foreign_key: { to_table: :content_chunks }
      t.integer     :content_chunk_5_id, index: true, foreign_key: { to_table: :content_chunks }
      t.integer     :content_chunk_6_id, index: true, foreign_key: { to_table: :content_chunks }
      t.integer     :content_chunk_7_id, index: true, foreign_key: { to_table: :content_chunks }
      t.integer     :further_information_chunk_id, index: true, foreign_key: { to_table: :further_information_chunks }
      t.text        :slug, index: true, null: false    # For Pretty URLS
      t.timestamps
    end
  end
end
