# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      ServiceRequest,
      params[:filterrific],
      select_options: { with_status: ServiceRequest.options_for_status },
      available_filters: [:with_status]
    ) || return
    @service_requests = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  rescue ActiveRecord::RecordNotFound => e
    puts "Had to reset filterrific params: #{e.message}"
    redirect_to(reset_filterrific_url(format: :html)) && return
  end

  def sms_balance
    @sms_json = SmsGetter.new.get_sms_balance
  end
end
