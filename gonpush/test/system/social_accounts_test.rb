require "application_system_test_case"

class SocialAccountsTest < ApplicationSystemTestCase
  setup do
    @social_account = social_accounts(:one)
  end

  test "visiting the index" do
    visit social_accounts_url
    assert_selector "h1", text: "Social Accounts"
  end

  test "creating a Social account" do
    visit social_accounts_url
    click_on "New Social Account"

    fill_in "Creator", with: @social_account.creator_id
    fill_in "Email", with: @social_account.email
    fill_in "Google", with: @social_account.google
    fill_in "Mobile", with: @social_account.mobile
    fill_in "Phone", with: @social_account.phone
    fill_in "Qq", with: @social_account.qq
    fill_in "Skype", with: @social_account.skype
    fill_in "Wechat", with: @social_account.wechat
    fill_in "Yahoo", with: @social_account.yahoo
    click_on "Create Social account"

    assert_text "Social account was successfully created"
    click_on "Back"
  end

  test "updating a Social account" do
    visit social_accounts_url
    click_on "Edit", match: :first

    fill_in "Creator", with: @social_account.creator_id
    fill_in "Email", with: @social_account.email
    fill_in "Google", with: @social_account.google
    fill_in "Mobile", with: @social_account.mobile
    fill_in "Phone", with: @social_account.phone
    fill_in "Qq", with: @social_account.qq
    fill_in "Skype", with: @social_account.skype
    fill_in "Wechat", with: @social_account.wechat
    fill_in "Yahoo", with: @social_account.yahoo
    click_on "Update Social account"

    assert_text "Social account was successfully updated"
    click_on "Back"
  end

  test "destroying a Social account" do
    visit social_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social account was successfully destroyed"
  end
end
