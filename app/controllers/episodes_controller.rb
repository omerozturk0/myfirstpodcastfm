class EpisodesController < ApplicationController
  before_action :authenticate_podcast!, except: [:show]
  before_action :set_podcast
  before_action :set_episode, except: [:new, :create]

  def new
  	@episode = @podcast.episodes.new
    authorize @episode
  end

  def create
  	@episode = @podcast.episodes.new episodes_params
    authorize @episode
  	if @episode.save
  		redirect_to podcast_episode_path(@podcast, @episode), notice: "Kayıt başarıyla eklendi!"
  	else
  		render :new
  	end
  end

  def show
  	@episodes = @podcast.episodes.order(id: :desc).reject { |e| e.id == @episode.id }
  end

  def edit
    authorize @episode
  end

  def update
  	if @episode.update episodes_params
  		redirect_to podcast_episode_path(@podcast, @episode), notice: "Kayıt başarıyla güncellendi!"
  	else
  		render :edit
  	end
  end

  def destroy
    authorize @episode
  	@episode.destroy
  	redirect_to root_path
  end

  private
  	def episodes_params
  		params.require(:episode).permit(:title, :description, :episode_thumbnail, :mp3)
  	end

  	def set_podcast
  		@podcast = Podcast.find(params[:podcast_id])
  	end

  	def set_episode
  		@episode = Episode.friendly.find(params[:id])
  	end
end
