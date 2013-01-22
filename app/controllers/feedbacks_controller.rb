# encoding: utf-8

class FeedbacksController < ApplicationController

  respond_to :js

  def create
    @feedback = Feedback.new
    respond_with @feedback
  end
end
