class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
     @post = Post.new(post_params)
     @post.user_id = current_user.id

    #  if params[:post][:image].blank?
    #   @post.image = nil
    #  end
    if @post.save
      flash[:notice] = 'Post created'
      redirect_to posts_path
    else 
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # if params[:post][:image].blank?
    #   @post.image = nil
    #  end
    if @post.update(post_params)
      flash[:notice] = 'Post Updated'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @categories = Category.all 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash[:notice] = 'Post Removed'

    redirect_to admin_posts_path
  end

  def index
    # if params[:search]
    #   @posts = Post.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    # else 
    @posts = Post.all
    # .order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
     
    # end
  end


  
 

   private 
    def  post_params
      params.require(:post).permit(:title, :category_id, :user_id, :body, :avatar)
    end 
end
