class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,  default: "", nul: false
      t.integer :prefecture,  default: "", nul: false
      t.string :city,         default: "", nul: false
      t.string :house_number, default: "", nul: false
      t.string :building_name
      t.string :phone_number, default: "", nul: false
      t.references :item,            nul: false, foreign_key: true
      t.timestamps
    end
  end
end
