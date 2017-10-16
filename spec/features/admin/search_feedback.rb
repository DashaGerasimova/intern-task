require "rails_helper"

feature "Admin can search for feedback in feedbacks#index" do
  let(:admin) { create(:user, :admin) }
  let!(:searched_feedback) { create(:feedback) }
  let!(:hidden_feedback) { create(:feedback) }

  scenario "Admin searches for feedback" do
    login_as admin
    visit feedbacks_path
    fill_in "search_term", with: searched_feedback.text
    expect(page).to have_content(searched_feedback.text)
    expect(page).not_to have_content(hidden_feedback.text)
  end
end
