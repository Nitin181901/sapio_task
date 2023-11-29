class HomeController < ApplicationController
  def index
  end

  def task_management    
  end

  def expense_tracker
    expenses = Expense.all
    @chart_data = expenses.map { |expense| { name: expense.date, data: { expense.date => expense.amount } } }  end

  def currency_converter
  end

  def travel_itenary
  end
end
