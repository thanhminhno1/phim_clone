class CategoriesController < AdminController
  before_action :load_cagegory, only: %i(edit update delete)

  def index
    @categories = Category.all.recent
  end

  def new
    @category = Category.new
  end

  def update
    if @category.update category_params
      redirect_to categories_path
    else
      render :edit
    end
  end

  def delete
    @category.destroy
    redirect_to categories_path
  end

  def create
    @category = Category.create! category_params
    redirect_to new_category_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def load_cagegory
    @category = Category.find params[:id]
  end
end
