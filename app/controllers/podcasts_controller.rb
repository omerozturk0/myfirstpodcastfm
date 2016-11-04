class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :dashboard]
  before_action :list_episodes, only: [:show, :dashboard]

  def index
    @podcasts = Podcast.order(id: :desc).paginate(page: params[:page], per_page: 12)
  end

  def show
  end

  def dashboard
    authorize @podcast
  end

  private
  	def set_podcast
  		if params[:id].nil?
  			@podcast = current_podcast
  		else
	  		@podcast = Podcast.find(params[:id])
  		end
  	end

  	def list_episodes
  		@episodes = @podcast.episodes.order(id: :desc).paginate(page: params[:page], per_page: 5)
  	end
end
