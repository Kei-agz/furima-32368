class CreateItems < ActiveRecord::Migration[6.0]
  def change do
    create_table :items do |t|

      t.string :name, null:false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :sipping_area_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :price, null: false
      t.references :user_id

      t.timestamps, :null:false
    end
  end
end
