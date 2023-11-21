class SubcategoriesController < ApplicationController
	def new
		@categories = Category.where(active: true)
	end

	def create
		@sub_category = Subcategory.new(sub_category_params)
	    @sub_category.active = true
	    if @sub_category.save
	      redirect_to home_expense_tracker_path, flash: { success: 'Category Created successfully' }
	    else
	      render :new
	    end	
	end

	def sub_category_params
		params.permit(:name, :category_id)
	end
end
