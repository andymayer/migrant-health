class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :user
      t.text       :content
      t.text        :slug, index: true, null: false    # For Pretty URLS
      t.timestamps
    end
  end
end
