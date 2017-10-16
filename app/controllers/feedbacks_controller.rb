class FeedbacksController < ApplicationController
  expose_decorated :feedback
  expose :user, -> { current_user }
  expose :feedbacks, -> { Feedback.order(:created_at).page params[:page] }

  def index
    authorize feedback
  end

  def create
    feedback.save
    respond_with feedback, location: root_path
  end

  def destroy
    authorize feedback
    feedback.destroy
    respond_with feedback
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end
end
