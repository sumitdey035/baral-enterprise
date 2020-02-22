# frozen_string_literal: true

class Address < ApplicationRecord
  validates :street, :location, :pincode, :customer_id, presence: true
  validates :pincode, numericality: true, length: { is: 6 }
  belongs_to :customer
end
