class CreateContentChunks < ActiveRecord::Migration[5.1]
  def change
    create_table :content_chunks do |t|
      t.text        :type
      t.text        :title
      t.text        :intro
      t.text        :content
      t.text        :after
      t.timestamps
    end
  end
end
