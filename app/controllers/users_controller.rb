class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		respond_to do |format|
			format.html { render 'static/home' }
			format.js { render :create }
		end
	end
	
	def user_params
		params.require(:user).permit(:month_income, :month_expense, :epf)
	end
end
