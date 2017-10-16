class Feedback < ApplicationRecord
  validates :name, :email, :text, presence: true
  validates :email, email_format: { message: "Email is incorrect" }

  def self.search(term)
    if term
      where("name LIKE ? OR text LIKE ?", "%#{term}%", "%#{term}%")
    else
      all
    end
  end
end
