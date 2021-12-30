require "application_system_test_case"

class DayOffsTest < ApplicationSystemTestCase
  setup do
    @day_off = day_offs(:one)
  end

  test "visiting the index" do
    visit day_offs_url
    assert_selector "h1", text: "Day offs"
  end

  test "should create day off" do
    visit day_offs_url
    click_on "New day off"

    fill_in "Date", with: @day_off.date
    fill_in "Nurse", with: @day_off.nurse_id
    click_on "Create Day off"

    assert_text "Day off was successfully created"
    click_on "Back"
  end

  test "should update Day off" do
    visit day_off_url(@day_off)
    click_on "Edit this day off", match: :first

    fill_in "Date", with: @day_off.date
    fill_in "Nurse", with: @day_off.nurse_id
    click_on "Update Day off"

    assert_text "Day off was successfully updated"
    click_on "Back"
  end

  test "should destroy Day off" do
    visit day_off_url(@day_off)
    click_on "Destroy this day off", match: :first

    assert_text "Day off was successfully destroyed"
  end
end
