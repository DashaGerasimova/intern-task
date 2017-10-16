require "rails_helper"

feature "Feedback creation" do
  let(:feedback) { FactoryGirl.create(:feedback) }

  scenario "Visitor creates feedback" do
    visit new_feedback_path

    fill_in "Name", with: feedback.name
    fill_in "Email", with: feedback.email
    fill_in "Text", with: feedback.text
    click_button "Create Feedback"

    expect(page).to have_content("Feedback was successfully sent")
  end
end
