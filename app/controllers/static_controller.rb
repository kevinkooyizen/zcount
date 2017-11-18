class StaticController < ApplicationController
  
  def home
    @user = User.new
  end
  
  def user_params
    params.require(:user).permit(:monthly_income, :monthly_expense)
  end
  
end
