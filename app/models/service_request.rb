class ServiceRequest < ApplicationRecord
  enum status: { created: 0, pending: 1, completed: 2, cancelled: 3 }

  validates :address_id, :customer_id, :status, :call_id, :problem, presence: true

  belongs_to :customer
  belongs_to :address

  before_validation :generate_call_id, on: :create

  private

  def generate_call_id
    self.call_id = Time.zone.today.to_s.delete('-') + rand(1000..9999).to_s
  end
end
