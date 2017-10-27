class CreateBidsTable < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :item_id
      t.integer :bidder_id
      t.decimal :amount

      t.timestamps
    end
  end
end
