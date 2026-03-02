require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get Students" do
    get groups_Students_url
    assert_response :success
  end

  test "should get Subjects" do
    get groups_Subjects_url
    assert_response :success
  end

  test "should get Tasks" do
    get groups_Tasks_url
    assert_response :success
  end

  test "should get Attendances" do
    get groups_Attendances_url
    assert_response :success
  end

  test "should get Grades" do
    get groups_Grades_url
    assert_response :success
  end

  test "should get BehaviorEntries" do
    get groups_BehaviorEntries_url
    assert_response :success
  end

  test "should get Reports" do
    get groups_Reports_url
    assert_response :success
  end

  test "should get Notifications" do
    get groups_Notifications_url
    assert_response :success
  end
end
