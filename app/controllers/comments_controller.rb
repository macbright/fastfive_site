class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    flash[:notice] = 'Comment Added'

    redirect_to post_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    # @comment = Comment.find(params[:id])
    # @post = @comment.post_id
  end

  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.update(comment_params)
      flash[:success] = 'Comment updated!'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  def show
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post_id
    flash[:danger] = 'Comment Deleted!' if @comment.destroy
    redirect_to post_path(@post)
  end


  private 
    def comment_params
      params.require(:comment).permit(:user, :body, :post)
    end

end
