class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, :null => false
      t.string :condition
      t.date :start_date
      t.date :end_date
      t.string :description
      t.decimal :price
      t.integer :owner_id

      t.timestamps
    end
  end
end
