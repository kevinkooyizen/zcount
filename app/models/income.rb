class Income < ApplicationRecord
  
  def year
    ((self.month*12)).round(2)
  end
  
  def daily
    ((self.month)/30).round(2)
  end
  
  def pay_per_hour
    (self.month.to_f/(20*8)).round(2)
  end
  
end
