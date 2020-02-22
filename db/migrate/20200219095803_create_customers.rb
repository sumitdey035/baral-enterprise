# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :primary_phone_no
      t.string :secondary_phone_no

      t.timestamps
    end
  end
end
