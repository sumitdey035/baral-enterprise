# frozen_string_literal: true

class SmsSender
  API_KEY = '25E4A61A938127'
  BASE_URL = 'https://sms.textmysms.com/app/smsapi/index.php'
  SENDER_ID = 'TXTDMO'

  attr_reader :message, :destination_number

  def initialize(message, destination_number)
    @message = message
    @destination_number = destination_number
  end

  def send_sms
    # return unless Rails.env.eql?('production')

    uri = URI(BASE_URL)
    params = {
      key: API_KEY, campaign: 0, type: 'text', routeid: 13,
      senderid: SENDER_ID, msg: message, contacts: destination_number
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end
end
