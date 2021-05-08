class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :type_payment
      t.decimal :value, :precision => 15, :scale => 10
      
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
