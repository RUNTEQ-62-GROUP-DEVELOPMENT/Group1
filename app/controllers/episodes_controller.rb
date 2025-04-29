class EpisodesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create]

  def create
    @episode = current_or_guest_user.episodes.build(episode_params)
    @episode.save
  end

  def destroy
    @episode = current_user.episodes.find(params[:id])
    @episode.destroy!
  end


  private

  def episode_params
    params.require(:episode).permit(:body).merge(post_id: params[:post_id])
  end
end
