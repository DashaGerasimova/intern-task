class FeedbackMailer < Devise::Mailer
  default from: "notifications@example.com"

  def send_feedback
    mail(to: "admin@example.com", subject: "New feedback!")
  end
end
