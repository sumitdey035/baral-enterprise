class CreateProductDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :product_details do |t|
      t.belongs_to :service_request, index: true, foreign_key: true
      t.string :category
      t.string :sub_category
      t.integer :quantity
      t.string :purchased_from
      t.string :bill_no
      t.date :bill_date
      t.boolean :warranty
      t.string :modelcode
      t.string :modelname
      t.string :serial_no

      t.timestamps
    end
  end
end
