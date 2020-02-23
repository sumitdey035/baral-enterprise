# frozen_string_literal: true

class Customer < ApplicationRecord
  filterrific(
    default_filter_params: {},
    available_filters: [ :search_query]
  )

  validates :name, :primary_phone_no, presence: true
  validates :primary_phone_no,
            numericality: true, length: { minimum: 10, maximum: 15 }
  validates :secondary_phone_no, allow_blank: true, allow_nil: true,
            numericality: true, length: { minimum: 10, maximum: 15 }
  has_many :addresses, dependent: :destroy
  has_many :service_requests, dependent: :destroy

  # scope :sorted_by, -> { order(name: :asc) }
  scope :search_query, ->(query) { search_by_name(query).or(search_primary_phone_no(query)).or(search_secondary_phone_no(query)) }
  scope :search_by_name, ->(query) { where('name ILIKE ?', "%#{query}%") }
  scope :search_primary_phone_no, ->(query) { where('primary_phone_no ILIKE ?', "%#{query}%") }
  scope :search_secondary_phone_no, ->(query) { where('secondary_phone_no ILIKE ?', "%#{query}%") }
end
