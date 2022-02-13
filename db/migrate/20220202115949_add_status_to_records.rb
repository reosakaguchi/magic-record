class AddStatusToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :audiences, :integer, default: 0, null: false
    add_column :records, :times, :integer, default: 0, null: false
  end
end
