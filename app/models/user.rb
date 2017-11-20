class User < ApplicationRecord
include ActionView::Helpers::NumberHelper

	def yearly_income
		((self.monthly_income*12)).round(2)
	end
	
	def daily_income
		((self.monthly_income)/30).round(2)
	end
	
	def hourly_income
		(self.monthly_income/(20*8)).round(2)
	end
	
	def yearly_expense
		((self.monthly_expense*12)).round(2)
	end
	
	def daily_expense
		((self.monthly_expense)/30).round(2)
	end
	
	def hourly_expense
		(self.monthly_expense/(20*8)).round(2)
	end
	
	def net_monthly
		(self.monthly_income - self.monthly_expense).round(2)
	end
	
end
