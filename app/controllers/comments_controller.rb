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

  private 
    def comment_params
      params.require(:comment).permit(:user, :body, :post)
    end
end
