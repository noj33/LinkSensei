require "test_helper"

feature "A user can sign up" do
  scenario "user sign up" do
    visit root_path
    within("//div[@id='signup']") do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end
    click_on "Sign up"
    page.text.must_include "Test Guy"
  end

  scenario "user tries to sign up with invalid data" do
    visit root_path
    click_on "Sign up"
    page.text.must_include "prohibited"
    page.text.must_include "Sign up"
  end

  scenario "a default conatiner is created on user creation" do
    visit root_path
    within("//div[@id='signup']") do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end
    click_on "Sign up"
    page.text.must_include "Staging"
end
