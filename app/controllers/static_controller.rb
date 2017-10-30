class StaticController < ApplicationController
  def home
    @income = Income.new
  end
end
