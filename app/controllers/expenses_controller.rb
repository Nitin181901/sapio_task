class ExpensesController < ApplicationController
	def new
		@subcategories = Subcategory.where(active: true)
		@categories = Category.where(active: true)
	end

	def create
		@expense = Expense.new(expenses_params)
	    @expense.active = true
	    if @expense.save
	      redirect_to expenses_path, flash: { success: 'Expense Created successfully' }
	    else
	      render :new
	    end	
	end

	def index
		
	end

	def expenses_params
		params.permit(:name, :description, :amount, :date, :category_id, :subcategory_id)
	end
end