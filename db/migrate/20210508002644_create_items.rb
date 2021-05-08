class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :external_code
      t.string :name
      t.decimal :price, :precision => 15, :scale => 10
      t.integer :quantity
      t.decimal :total, :precision => 15, :scale => 10
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
