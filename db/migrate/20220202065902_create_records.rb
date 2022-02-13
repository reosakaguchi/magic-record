class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :magic_name
      t.text :body
      t.text :merit
      t.text :demerit
      t.text :consideration
      t.integer :user_id

      t.timestamps
    end
  end
end
