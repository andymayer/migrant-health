class CreateFurtherInformationChunks < ActiveRecord::Migration[5.1]
  def change
    create_table :further_information_chunks do |t|
      t.text        :title
      t.text        :intro
      t.text        :after
      t.timestamps
    end
  end
end
