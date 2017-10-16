class FeedbacksController < ApplicationController
  expose_decorated :feedback
  expose :feedbacks, -> { Feedback.all }

  def create
    respond_with feedback, location: root_path
  end

  def destroy
    feedback.destroy
    respond_with feedback
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end
end
