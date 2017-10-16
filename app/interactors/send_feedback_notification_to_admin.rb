class SendFeedbackNotificationToAdmin
  include Interactor

  def call
    FeedbackMailer.send_feedback.deliver
  end
end
