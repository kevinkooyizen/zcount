class IncomesController < ApplicationController
  def create
    @income = Income.new(income_params)
    @income.yearly = ((params["income"]["monthly"]).to_f*12).round(2)
    @income.daily = ((params["income"]["monthly"]).to_f/30).round(2)
    @income.pay_per_hour = (params["income"]["monthly"].to_f/(20*8)).round(2)
    respond_to do |format|
      format.html { render 'static/home' }
      format.js { render :create }
    end
  end

  private

  def income_params
    params.require(:income).permit(:monthly)
  end
end
