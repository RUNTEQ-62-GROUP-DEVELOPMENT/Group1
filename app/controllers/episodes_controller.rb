class EpisodesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[create]

  def create
    @episode = current_or_guest_user.episodes.build(episode_params)
    if @episode.save
      redirect_to post_path(episode_params[:post_id]),success: 'エピソードを投稿しました'
    else
      @post = Post.find(episode_params[:post_id])
      @episodes = @post.episodes.includes(:user).order(created_at: :desc)
      flash.now[:danger] = 'エピソードを投稿できませんでした'
      render template: "posts/show", status: :unprocessable_entity
    end
  end


  private

  def episode_params
    params.require(:episode).permit(:body).merge(post_id: params[:post_id])
  end
end
