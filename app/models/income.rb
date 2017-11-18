class Income < ApplicationRecord
  
  def yearly
    ((self.monthly*12)).round(2)
  end
  
  def daily
    ((self.monthly)/30).round(2)
  end
  
  def pay_per_hour
    (self.monthly.to_f/(20*8)).round(2)
  end
  
end
