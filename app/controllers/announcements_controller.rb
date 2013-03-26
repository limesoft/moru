# encoding: utf-8

class AnnouncementsController < ApplicationController

  respond_to :js, :html

  def hide
    ids = [params[:id], *cookies.signed[:hide_announcement_ids]]
    cookies.permanent.signed[:hide_announcement_ids] = ids
    respond_with ids
  end
end
