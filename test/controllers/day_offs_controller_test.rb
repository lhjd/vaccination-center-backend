require "test_helper"

class DayOffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day_off = day_offs(:one)
  end

  test "should get index" do
    get day_offs_url
    assert_response :success
  end

  test "should get new" do
    get new_day_off_url
    assert_response :success
  end

  test "should create day_off" do
    assert_difference("DayOff.count") do
      post day_offs_url, params: { day_off: { date: @day_off.date, nurse_id: @day_off.nurse_id } }
    end

    assert_redirected_to day_off_url(DayOff.last)
  end

  test "should show day_off" do
    get day_off_url(@day_off)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_off_url(@day_off)
    assert_response :success
  end

  test "should update day_off" do
    patch day_off_url(@day_off), params: { day_off: { date: @day_off.date, nurse_id: @day_off.nurse_id } }
    assert_redirected_to day_off_url(@day_off)
  end

  test "should destroy day_off" do
    assert_difference("DayOff.count", -1) do
      delete day_off_url(@day_off)
    end

    assert_redirected_to day_offs_url
  end
end
