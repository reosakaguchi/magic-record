class CreateRemarks < ActiveRecord::Migration[5.2]
  def change
    create_table :remarks do |t|
      t.text :remark
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
