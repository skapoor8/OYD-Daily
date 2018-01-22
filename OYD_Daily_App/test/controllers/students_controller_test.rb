require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { age: @student.age, birth_date: @student.birth_date, city: @student.city, class_group: @student.class_group, country: @student.country, drop_reason: @student.drop_reason, email: @student.email, facebook: @student.facebook, first_name: @student.first_name, home_phone: @student.home_phone, how_found: @student.how_found, instagram: @student.instagram, intern_points: @student.intern_points, last_name: @student.last_name, last_test_date: @student.last_test_date, middle_name: @student.middle_name, mobile_phone: @student.mobile_phone, next_rank: @student.next_rank, next_test_date: @student.next_test_date, nick_name: @student.nick_name, occupation: @student.occupation, oyd_id: @student.oyd_id, parental_contact: @student.parental_contact, position: @student.position, postal_code: @student.postal_code, rank: @student.rank, status: @student.status, street2: @student.street2, street: @student.street, twitter: @student.twitter } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { age: @student.age, birth_date: @student.birth_date, city: @student.city, class_group: @student.class_group, country: @student.country, drop_reason: @student.drop_reason, email: @student.email, facebook: @student.facebook, first_name: @student.first_name, home_phone: @student.home_phone, how_found: @student.how_found, instagram: @student.instagram, intern_points: @student.intern_points, last_name: @student.last_name, last_test_date: @student.last_test_date, middle_name: @student.middle_name, mobile_phone: @student.mobile_phone, next_rank: @student.next_rank, next_test_date: @student.next_test_date, nick_name: @student.nick_name, occupation: @student.occupation, oyd_id: @student.oyd_id, parental_contact: @student.parental_contact, position: @student.position, postal_code: @student.postal_code, rank: @student.rank, status: @student.status, street2: @student.street2, street: @student.street, twitter: @student.twitter } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
