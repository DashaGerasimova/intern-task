require "rails_helper"

feature "Feedback#index for admins" do
  let(:admin) { create(:user, :admin) }
  let!(:feedback) { create(:feedback) }

  scenario "Admin visits feedback#index" do
    login_as admin
    visit feedbacks_path
    expect(page).to have_content("All feedbacks")
    expect(page).to have_content(feedback.text)
  end
end
