class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
 
  
  def index
    @posts = Post.last(6)
    @categories = Category.all
  end
end
