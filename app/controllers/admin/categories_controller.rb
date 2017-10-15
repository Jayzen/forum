class Admin::CategoriesController < Admin::BaseController
  layout 'admin/layouts/admin'

  before_action :find_root_categories, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    if params[:id].blank?
      @categories = Category.roots
    else
      @category = Category.find(params[:id])
      @categories = @category.children
    end

    @categories = @categories.order(id: "desc").page(params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit!)

    if @category.save
      flash[:notice] = "保存成功"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def edit
    render action: :new
  end

  def update
    @category.attributes = params.require(:category).permit!

    if @category.save
      flash[:notice] = "修改成功"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "删除成功"
      redirect_to admin_categories_path
    else
      flash[:notice] = "删除失败"
      redirect_to :back
    end
  end

  private
    def find_root_categories
      @root_categories = Category.roots.order(id: "desc")
    end

    def find_category
      @category = Category.find(params[:id])
    end
end
