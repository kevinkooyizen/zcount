class User < ApplicationRecord
	include ActionView::Helpers::NumberHelper

	# Tax
	
	def taxable?
		if self.month_income > 3000
			true
		else
			false
		end
	end
	
	def year_tax_10
		if self.year_income >= 50000
			(50000-36000) * 0.1
		else
			(self.year_income - 36000) * 0.1
		end
	end
	
	def year_tax_20
		(self.year_income - 50000)*0.2
	end
	
	def month_tax_10
		self.year_tax_10/12
	end
	
	def month_tax_20
		self.year_tax_20/12
	end
	
	def total_year_tax
		self.year_tax_10 + self.year_tax_20
	end
	
	def total_month_tax
		self.month_tax_10 + self.month_tax_20
	end
	
	# Gross
	def year_income
		self.month_income*12
	end
	
	def daily_income
		(self.month_income)/30
	end
	
	def hourly_income
		self.month_income/(20*8)
	end

	# EPF
	
	def year_epf
		self.epf*self.year_income
	end
	
	def month_epf
		self.epf*self.month_income
	end
	
	def year_income_after_epf
		self.year_income*(1-self.epf)
	end
	
	def month_income_after_epf
		self.month_income*(1-self.epf)
	end
	
	def daily_income_after_epf
		self.daily_income*(1-self.epf)
	end
	
	def hourly_income_after_epf
		self.hourly_income*(1-self.epf)
	end
	
	# Expenses
	
	def year_expense
		self.month_expense*12
	end
	
	def daily_expense
		(self.month_expense)/30
	end
	
	def hourly_expense
		self.month_expense/(20*8)
	end
	
	def net_month
		self.month_income - self.month_expense
	end
	
end
