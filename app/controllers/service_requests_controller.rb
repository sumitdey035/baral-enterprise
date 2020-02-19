class ServiceRequestsController < ApplicationController
  before_action :set_customer
  before_action :set_service_request, only: %i[show edit update]

  def index
    @service_requests = ServiceRequest.all
  end

  def show; end

  def new
    @service_request = @customer.service_requests.new
  end

  def edit; end

  def create
    @service_request = @customer.service_requests.new(service_request_params)
    if @service_request.save
      redirect_to @service_request.customer, notice: 'Service request was successfully created.'
    else
      render :new
    end
  end

  def update
    if @service_request.update(service_request_params)
      redirect_to @service_request.customer, notice: 'Service request was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_service_request
    @service_request = @customer.service_requests.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def service_request_params
    params.require(:service_request).permit(:address_id, :problem, :status, :customer_remark)
  end
end
