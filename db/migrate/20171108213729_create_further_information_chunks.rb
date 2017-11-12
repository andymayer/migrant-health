class CreateFurtherInformationChunks < ActiveRecord::Migration[5.1]
  def change
    create_table :further_information_chunks do |t|
      t.text        :title
      t.text        :intro
      t.text        :info_1_url
      t.text        :info_1_title
      t.text        :info_2_url
      t.text        :info_2_title
      t.text        :info_3_url
      t.text        :info_3_title
      t.text        :info_4_url
      t.text        :info_4_title
      t.text        :info_5_url
      t.text        :info_5_title
      t.text        :info_6_url
      t.text        :info_6_title
      t.text        :after
      t.timestamps
    end
  end
end
