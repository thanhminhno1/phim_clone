class CategoriesController < AdminController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create! category_params
    redirect_to new_category_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
