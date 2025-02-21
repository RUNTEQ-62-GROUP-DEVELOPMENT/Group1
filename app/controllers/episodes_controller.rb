class EpisodesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[create]

  def create
    @episode = current_or_guest_user.episodes.build(episode_params)
    if @episode.save
      redirect_to post_path(episode_params[:post_id])
      # redirect_to  ワード詳細ページ＆成功フラッシュメッセージ「エピソードを投稿しました」
    else
      @post = Post.find(episode_params[:post_id])
      @episodes = @post.episodes.includes(:user).order(created_at: :desc)
      render template: "posts/show", status: :unprocessable_entity
      # render: ワード詳細ページ＆失敗フラッシュメッセージ「エピソードを投稿できませんでした」
    end
  end


  private

  def episode_params
    params.require(:episode).permit(:body).merge(post_id: params[:post_id])
  end
end
