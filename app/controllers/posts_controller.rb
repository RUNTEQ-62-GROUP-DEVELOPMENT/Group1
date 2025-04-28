class PostsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), success: "ワードを投稿しました"
    else
      flash.now[:danger] = "ワードを投稿できませんでした"
      render :new, status: :unprocessable_entity
    end
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
