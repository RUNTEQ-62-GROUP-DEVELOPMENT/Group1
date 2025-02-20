class EpisodesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[create]

  def create
    binding.pry
    @episode = current_or_guest_user.episodes.build(episode_params)
    # @episode = current_user.episodes.build(episode_params)
    binding.pry
    if @episode.save
      # redirect_to  ワード詳細ページ＆成功フラッシュメッセージ「エピソードを投稿しました」
    else
      # render: ワード詳細ページ＆失敗フラッシュメッセージ「エピソードを投稿できませんでした」
    end
  end


  private

  def episode_params
    params.require(:episode).permit(:body).merge(post_id: params[:post_id])
  end
end
