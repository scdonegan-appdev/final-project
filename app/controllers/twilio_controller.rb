require 'rubygems'
require 'twilio-ruby'

class TwilioController < ActionController

   def text_reminder
       TwilioController.send_message
   end

    def self.send_message
    require("twilio-ruby")

    twilio_sid = ENV.fetch("TWILIO_API_SID")
    twilio_token = ENV.fetch("TWILIO_API_KEY")
     
    sms_parameters = {
      :from => ENV.fetch("TWILIO_ASSIGNED_PHONE"),
      :to => ENV.fetch("<%= phone_reminder.phone_number %>"),
      :body => "Friendly reminder to take a MMMoment to reflect today!"
    }
    # Set up a client to talk to the Twilio REST API
    twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    # Send your message through the client
    twilio_client.api.account.messages.create(sms_parameters)
    
    puts call.to
    
    end
    
end