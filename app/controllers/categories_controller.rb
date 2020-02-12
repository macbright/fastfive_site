class CategoriesController < ApplicationController
  def new
    # @page_title = 'Add Category'
    @category = Category.new
  end

  def create
     @category = Category.new(category_params)
     if @category.save
      flash[:notice] = 'Category created'
      redirect_to user_path(current_user)
     else 
      render 'new'
     end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category Updated'

      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all 
    @posts = @category.posts
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash[:notice] = 'Category Removed'

    redirect_to user_path(current_user)
  end

  def index
    # if params[:search]
    #   @categories = Category.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    # else 
    @categories = Category.all
      # .order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    # end
  end

 

   private 
    def  category_params
      params.require(:category).permit(:title)
    end 
end
