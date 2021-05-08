class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.string :country
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.decimal :latitude, { :precision=>10, :scale=>6 }
      t.decimal :longitude, { :precision=>10, :scale=>6 }
      t.string :postal_code
      t.string :number

      t.timestamps
    end
  end
end
