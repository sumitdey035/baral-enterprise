class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :customer, index: true
      t.text :street
      t.string :location
      t.text :landmark
      t.string :pincode

      t.timestamps
    end
  end
end
