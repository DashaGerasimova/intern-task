require "rails_helper"

feature "Feedback creation by logged in user" do
  include_context "current user signed in"

  scenario "Visitor creates feedback" do
    visit new_feedback_path
    expect(page).to have_field("Name", with: current_user.full_name)
    expect(page).to have_field("Email", with: current_user.email)
    fill_in "Text", with: Faker::Lorem.sentence
    click_button "Create Feedback"

    expect(page).to have_content("Feedback was successfully sent")
  end
end
