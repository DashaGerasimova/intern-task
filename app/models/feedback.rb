class Feedback < ApplicationRecord
  validates :name, :email, :text, presence: true

  def self.search(term)
    if term
      where("name LIKE ? OR text LIKE ?", "%#{term}%", "%#{term}%")
    else
      all
    end
  end
end
