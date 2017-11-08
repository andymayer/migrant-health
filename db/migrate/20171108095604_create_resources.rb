class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.text        :type,          null: false
      t.text        :title,   null: false
      t.text        :intro,    null: false
      t.text        :video_url
      t.timestamps
    end
  end
end
