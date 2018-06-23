require 'test_helper'

class MltAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mlt_attendance = mlt_attendances(:one)
  end

  test "should get index" do
    get mlt_attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_mlt_attendance_url
    assert_response :success
  end

  test "should create mlt_attendance" do
    assert_difference('MltAttendance.count') do
      post mlt_attendances_url, params: { mlt_attendance: { course: @mlt_attendance.course, lesson: @mlt_attendance.lesson, mlt_date: @mlt_attendance.mlt_date, student_id: @mlt_attendance.student_id } }
    end

    assert_redirected_to mlt_attendance_url(MltAttendance.last)
  end

  test "should show mlt_attendance" do
    get mlt_attendance_url(@mlt_attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_mlt_attendance_url(@mlt_attendance)
    assert_response :success
  end

  test "should update mlt_attendance" do
    patch mlt_attendance_url(@mlt_attendance), params: { mlt_attendance: { course: @mlt_attendance.course, lesson: @mlt_attendance.lesson, mlt_date: @mlt_attendance.mlt_date, student_id: @mlt_attendance.student_id } }
    assert_redirected_to mlt_attendance_url(@mlt_attendance)
  end

  test "should destroy mlt_attendance" do
    assert_difference('MltAttendance.count', -1) do
      delete mlt_attendance_url(@mlt_attendance)
    end

    assert_redirected_to mlt_attendances_url
  end
end
