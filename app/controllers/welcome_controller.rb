class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
 
  
  def index
    @posts = Post.last(6)
    @lastPosts = Post.last(20)
    @categories = Category.all
    @cards =  Card.select(:name, :cardPrice).distinct
  end
end
