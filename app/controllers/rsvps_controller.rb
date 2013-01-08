# encoding: utf-8

class RsvpsController < ApplicationController

  respond_to :json

  # load_and_authorize_resource

  def create
    @rsvp = Rsvp.new
    respond_with @rsvp
  end

end
