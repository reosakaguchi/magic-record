class AddGenderStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender_status, :integer
  end
end
