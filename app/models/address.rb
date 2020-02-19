class Address < ApplicationRecord
  validates :street, :location, :pincode, presence: true
  validates :pincode, numericality: true, length: { is: 6 }
  belongs_to :customer
end
