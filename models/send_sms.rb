require 'twilio-ruby'

class SendSms
  attr_accessor :body

  class << self
    def add(body)
      @commands ||=[]
      @commands << SendSms.new(body).send
    end

    def history
      @commands
    end
  end

  def initialize(body)
    @body = body
    @account_sid = "AC5a37189a64b429f01a70961f1cb3e521"
    @auth_token = "a85d40f54eabd6850621753b6eb2fe73"

    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end


  def send
    @client.account.messages.create({
      from: '+441173251885',
      to: '+447572227006',
      body: "Sent this from mah code. I love it, but I love you more! <3"
    })
  end



end