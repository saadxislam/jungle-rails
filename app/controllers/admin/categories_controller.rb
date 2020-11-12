class Admin::CategoriesController < ApplicationController
  #actions are methods on the class
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(
      :name,
      :created_at,
      :updated_at,
    )
  end
end
