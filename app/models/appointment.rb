class Appointment < ActiveRecord::Base

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :time, presence: true

  after_create :reminder

  @@REMINDER_TIME = 30.minutes # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
  def reminder

    account_sid = 'AC3d3d6027333ad86503dfe14bc2c3bbca'
    auth_token = '3af8403ac5d76142f655b1628b8b9249'

   # set up a client to talk to the Twilio REST API 
   @client = Twilio::REST::Client.new account_sid, auth_token
   puts @client.inspect
   sms = @client.account.sms.messages.create(:body => "All in the game, yo",
    :to => self.phone_number,
    :from => "+15005550006")

    puts message.to
  end

  def when_to_run
    time - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
