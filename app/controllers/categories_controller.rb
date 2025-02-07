class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  
  def create
    binding.pry
    
    @category = Category.new(category_params)

      if @category.save
        flash[:notice] = "Category is sucessfully created"
        redirect_to products_path
      end
    
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
