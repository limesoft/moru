# encoding: utf-8

class ProfilesController < ApplicationController

	respond_to :js, :json, only: [:update]

	def show
		@user = User.includes(topics: :votes).find(params[:id])
	end

	def update
		current_user.update_attributes(name: params[:user][:name])
		respond_with(current_user)
	end
end
