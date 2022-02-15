class RenameAudiencesColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :audiences, :audience_status
  end
end
