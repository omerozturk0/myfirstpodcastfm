class PodcastPolicy < ApplicationPolicy
	def dashboard?
		return true if @user.id == @record.id
	end
end
