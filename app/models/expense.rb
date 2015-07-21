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

end
