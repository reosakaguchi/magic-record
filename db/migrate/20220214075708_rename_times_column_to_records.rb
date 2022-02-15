class RenameTimesColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :times, :time
  end
end
