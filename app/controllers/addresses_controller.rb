class AddressesController < ApplicationController
  before_action :set_customer
  before_action :set_address, only: [:edit, :update, :destroy]

  def new
    @address = @customer.addresses.new
  end

  def edit; end

  def create
    @address = @customer.addresses.new(address_params)
    if @address.save
      redirect_to @address.customer, notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to @address.customer, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to @customer, notice: 'Address was successfully destroyed.'
  end

  private
    def set_address
      @address = @customer.addresses.find(params[:id])
    end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

    def address_params
      params.require(:address).permit(:street, :location, :landmark, :pincode)
    end
end
