class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @episode = Episode.new
    @episodes = @post.episodes.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
