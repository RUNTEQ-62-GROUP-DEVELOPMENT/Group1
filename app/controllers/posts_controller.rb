class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user) # .page(params[:page])
  end
end
