# encoding: utf-8

class FeedbacksController < ApplicationController

  respond_to :js

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user if user_signed_in?
    @feedback.save
    respond_with @feedback
  end

  private
    def feedback_params
      params.require(:feedback).permit(:content)
    end
end
