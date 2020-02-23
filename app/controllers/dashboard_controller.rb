# frozen_string_literal: true

class DashboardController < ApplicationController
  def index; end

  def sms_balance
    @sms_json = SmsGetter.new.get_sms_balance
  end
end
