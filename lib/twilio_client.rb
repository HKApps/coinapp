class TwilioClient
  attr_reader :twilio, :number

  def initialize
    @twilio = Twilio::REST::Client.new(
      ENV['TWILIO_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )

    @number = ENV['TWILIO_NUMBER']
  end

  # receiver_num format is "+19876543"
  def send_sms(receiver_num, message)
    twilio.account.messages.create(
      from: number,
      to: receiver_num,
      body: message
    )
  end
end
