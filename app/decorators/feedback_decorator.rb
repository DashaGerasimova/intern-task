class FeedbackDecorator < ApplicationDecorator
  delegate_all

  def user_name
  	h.current_user.try(:full_name) 
  end

  def user_email
  	h.current_user.try(:email)
  end
end
