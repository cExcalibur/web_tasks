class FeedbacksController < ApplicationController
  def index
    if session[:id]
      @feedbacks = Feedback.all
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end
end
