class FeedbacksController < ApplicationController
  expose_decorated :feedback
  expose :user, -> { current_user }
  expose :feedbacks, -> { set_feedbacks }

  def index
    authorize feedback
  end

  def create
    feedback.save
    respond_with feedback, location: root_path
    SendFeedbackNotificationToAdmin.call
  end

  private

  def set_feedbacks
    Feedback.search(params[:search_term]).order(:created_at).page params[:page]
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end
end
