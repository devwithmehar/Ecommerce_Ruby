class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.references :order, null: false, foreign_key: true
      t.decimal :unit_price

      t.timestamps
    end
  end
end
