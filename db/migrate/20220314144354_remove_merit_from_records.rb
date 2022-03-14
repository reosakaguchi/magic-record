class RemoveMeritFromRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :merit, :string
    remove_column :records, :demerit, :string
    remove_column :records, :consideration, :string
  end
end
