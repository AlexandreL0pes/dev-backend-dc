class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :external_code
      t.decimal :subtotal
      t.decimal :delivery_fee
      t.decimal :total
      t.datetime :created_date

      t.timestamps
    end
  end
end
