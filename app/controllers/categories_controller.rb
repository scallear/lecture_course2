class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @title = @category.name
  end

  def new
    @title = "Add Category"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "\"#{@category.name}\" category added."
      redirect_to new_category_path
    else
      render :new
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
