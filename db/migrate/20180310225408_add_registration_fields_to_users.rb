class AddRegistrationFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :job_title, :string
    add_column :users, :institution, :string
    add_column :users, :location, :string
  end
end
