class ExpensesController < ApplicationController
  def create
    @income = Income.new(income_params)
    @income.yearly = (@income.monthly.to_f*12).round(2)
    @income.daily = (@income.monthly.to_f/30).round(2)
    @income.pay_per_hour = (@income.monthly.to_f/(20*8)).round(2)
    @expense = Expense.new(expense_params)
    @expense.monthly = (@expense.daily.to_f*30).round(2)
    @net = @income.monthly - @expense.monthly
    respond_to do |format|
      format.html { render 'static/home' }
      format.js { render :create }
    end
#     //<%= j(render 'foldername/filename', htmlvariablename: @controllervariablename) %>
# // j is for not rendering other things(application.html.erb and so on...)
# // and also to render/not to render javascript
  end

  def income_params
    params.require(:income).permit(:monthly)
  end

  def expense_params
    params.require(:expense).permit(:daily)
  end
end
