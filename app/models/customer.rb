# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :name, :primary_phone_no, presence: true
  validates :primary_phone_no, :secondary_phone_no,
            numericality: true, length: { minimum: 10, maximum: 15 }
  has_many :addresses, dependent: :destroy
  has_many :service_requests, dependent: :destroy
end
