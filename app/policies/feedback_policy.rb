class FeedbackPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def destroy?
    admin?
  end
end
