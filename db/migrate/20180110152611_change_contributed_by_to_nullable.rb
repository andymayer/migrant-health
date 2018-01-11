class ChangeContributedByToNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :resources, :contributed_by, :text, null: true
  end
end
