# frozen_string_literal: true

class ServiceRequest < ApplicationRecord
  self.per_page = 10
  filterrific(
    default_filter_params: {},
    available_filters: [ :search_query, :with_status ]
  )

  CUSTOMER_CARE_NO = '9733613999'
  BRAND_NAME = 'BARAL Enterprise'
  enum status: { created: 0, pending: 1, completed: 2, cancelled: 3 }

  validates :address_id, :customer_id, :status, :call_id, :problem, presence: true

  belongs_to :customer
  belongs_to :address
  has_one :product_detail, dependent: :destroy
  accepts_nested_attributes_for :product_detail

  before_validation :generate_call_id, on: :create
  after_create :send_sms

  scope :search_query, ->(query) { joins(:customer).merge(Customer.search_query(query).or(search_request_id(query))) }
  scope :search_request_id, ->(query) { where('call_id ILIKE ?', "%#{query}%") }
  scope :with_status, ->(query) { where(status: query) }

  def message_content_for_create
    msg = "Thank you for calling #{BRAND_NAME}. Your Service Request No is #{call_id}. "
    msg + "For any further assistance please contact us on #{CUSTOMER_CARE_NO}"
  end

  def self.options_for_status
    statuses.map {|k, v| [k.humanize.capitalize, k]}
  end

  private

  def generate_call_id
    self.call_id = Time.zone.today.to_s.delete('-') + rand(1000..9999).to_s
  end

  def send_sms
    SmsSender.new(message_content_for_create, customer.primary_phone_no).send_sms
  end
end
