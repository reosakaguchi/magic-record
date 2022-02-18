class AddTitleToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :title, :string
  end
end
