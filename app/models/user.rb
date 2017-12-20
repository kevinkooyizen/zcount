class User < ApplicationRecord
	include ActionView::Helpers::NumberHelper

	# EPF & SOCSO
	
	def year_socso
		0.005*self.year_income
	end
	
	def month_socso
		0.005*self.month_income
	end
	
	def year_income_after_socso
		self.year_income*(1-0.005)
	end
	
	def month_income_after_socso
		self.month_income*(1-0.005)
	end
	
	def daily_income_after_socso
		self.daily_income*(1-0.005)
	end
	
	def hourly_income_after_socso
		self.hourly_income*(1-0.005)
	end

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
	
	def year_epf_socso
		self.year_epf + self.year_socso
	end
	
	def month_epf_socso
		self.month_epf + self.month_socso
	end
	
	# EXPENSES
	
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
	
	# INCOME
	def year_income
		self.month_income*12
	end
	
	def daily_income
		(self.month_income)/30
	end
	
	def hourly_income
		self.month_income/(20*8)
	end
	
	# NET
	
	def year_after_tax_epf_socso
		if self.taxable?
			self.year_income - self.year_total_tax - self.year_epf - self.year_socso
		else
			self.year_income - self.year_epf - self.year_socso
		end
	end
	
	def month_after_tax_epf_socso
		if self.taxable?
			self.month_income - self.month_total_tax - self.month_epf - self.month_socso
		else
			self.month_income - self.month_epf - self.month_socso
		end
	end
	
	# TAX
	
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
	
	def year_total_tax
		self.year_tax_10 + self.year_tax_20
	end
	
	def month_total_tax
		self.month_tax_10 + self.month_tax_20
	end

end
