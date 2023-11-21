class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
    @category.active = true
    if @category.save
      redirect_to home_expense_tracker_path, flash: { success: 'Category Created successfully' }
    else
      render :new
    end
	end

  def category_params
    params.require(:category).permit(:name)
  end
end
