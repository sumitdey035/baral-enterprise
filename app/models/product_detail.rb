class ProductDetail < ApplicationRecord
  belongs_to :service_request

  validates_uniqueness_of :service_request_id
end
