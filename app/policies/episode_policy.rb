class EpisodePolicy < ApplicationPolicy
	def new?
		return true if @user.id == @record.podcast.id
	end

	def create?
		new?
	end

	def edit?
		return true if @user.id == @record.podcast_id
	end

	def update?
		edit?
	end

	def destroy?
		edit?
	end
end
