require 'twilio-ruby'
class Expense < ActiveRecord::Base

  def self.min_amount_sum
     min_arr,max_arr, min_sum, max_sum = [],[], 0, 0
     expenses = Expense.all
     expenses.each do |e|
       min_arr << e.min_amount
       min_sum = min_arr.sum
      
       max_arr << e.max_amount if e.max_amount
       max_sum = max_arr.sum
      
     end
   return min_sum, max_sum
  end


  def send_text_message
    account_sid = 'AC3d3d6027333ad86503dfe14bc2c3bbca'
    auth_token = '3af8403ac5d76142f655b1628b8b9249' 
 
   # set up a client to talk to the Twilio REST API 
   @client = Twilio::REST::Client.new account_sid, auth_token 
   puts @client.inspect
   sms = @client.account.sms.messages.create(:body => "All in the game, yo",
    :to => "+14807382660",
    :from => "+15005550006") 
   #puts sms.body

  end


end
