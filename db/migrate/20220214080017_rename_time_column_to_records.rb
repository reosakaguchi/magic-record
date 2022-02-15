class RenameTimeColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :time, :time_status
  end
end
