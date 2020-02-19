class CreateServiceRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :service_requests do |t|
      t.references :customer, index: true
      t.references :address, index: true
      t.string :call_id
      t.text :problem
      t.integer :status, default: 0
      t.text :customer_remark

      t.timestamps
    end
  end
end
