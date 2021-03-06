class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :sipping_area_id,    null: false
      t.string :city,                null: false
      t.string :house_number,        null: false
      t.string :building_number
      t.string :postal_code,         null: false
      t.string :phone_number,        null: false
      t.references :buyer,           foreign_key: true
      
      t.timestamps
    end
  end
end
