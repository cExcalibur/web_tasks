class Admin::FeedbacksController < ApplicationController
  before_action:authorize

  def index
    @feedbacks = Feedback.all
  end
end
