class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user
      t.references :question
      t.references :answer
      t.timestamps
    end
  end
end
