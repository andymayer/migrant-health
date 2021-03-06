# This migration comes from acts_as_taggable_on_engine (originally 1)

class ActsAsTaggableOnMigration < ActiveRecord::Migration[5.1]

  def change
    create_table :tags do |t|
      t.string  :name
      t.integer :taggings_count, default: 0
      t.text    :description
      t.text    :slug, index: true
    end

    create_table :taggings do |t|
      t.references :tag, index: true

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.references :taggable, polymorphic: true, index: true
      t.references :tagger,   polymorphic: true, index: true

      # Limit is created to prevent MySQL error on index
      # length for MyISAM table type: http://bit.ly/vgW2Ql
      t.string :context, limit: 128

      t.datetime :created_at
    end

    add_index :taggings, :context
    add_index :taggings, [:tagger_id, :tagger_type]
    add_index :taggings, [:taggable_id, :taggable_type, :tagger_id, :context], name: 'taggings_idy'

    add_index :tags, :name, unique: true
    add_index :taggings,
              [:tag_id, :taggable_id, :taggable_type, :context, :tagger_id, :tagger_type],
              unique: true, name: 'taggings_idx'

  end
end
