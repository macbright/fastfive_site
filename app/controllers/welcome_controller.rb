class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
 
  
  def index
    @post = Post.new
  end
end
