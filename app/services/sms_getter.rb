# frozen_string_literal: true

class SmsGetter
  API_KEY = '25E4A61A938127'
  BASE_URL = 'https://sms.textmysms.com/app/miscapi'

  def get_sms_balance
    uri = URI("#{BASE_URL}/#{API_KEY}/getBalance/true/")
    res = Net::HTTP.get_response(uri)
    res.body
  end
end
