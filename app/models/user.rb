class User < ApplicationRecord
	include ActionView::Helpers::NumberHelper

	# Gross
	def yearly_income
		self.monthly_income*12
	end
	
	def daily_income
		(self.monthly_income)/30
	end
	
	def hourly_income
		self.monthly_income/(20*8)
	end

	# EPF
	
	def yearly_epf
		self.epf*self.yearly_income
	end
	
	def monthly_epf
		self.epf*self.monthly_income
	end
	
	def yearly_income_after_epf
		self.yearly_income*(1-self.epf)
	end
	
	def monthly_income_after_epf
		self.monthly_income*(1-self.epf)
	end
	
	def daily_income_after_epf
		self.daily_income*(1-self.epf)
	end
	
	def hourly_income_after_epf
		self.hourly_income*(1-self.epf)
	end
	
	# Expenses
	
	def yearly_expense
		self.monthly_expense*12
	end
	
	def daily_expense
		(self.monthly_expense)/30
	end
	
	def hourly_expense
		self.monthly_expense/(20*8)
	end
	
	def net_monthly
		self.monthly_income - self.monthly_expense
	end
	
end
