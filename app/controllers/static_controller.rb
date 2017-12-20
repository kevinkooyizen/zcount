class StaticController < ApplicationController
  
  def home
    @user = User.new
  end
  
  def user_params
    params.require(:user).permit(:month_income, :month_expense)
  end
  
end
