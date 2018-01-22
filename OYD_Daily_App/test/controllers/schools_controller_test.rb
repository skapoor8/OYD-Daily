require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post schools_url, params: { school: { city: @school.city, country: @school.country, email: @school.email, main_ins_id: @school.main_ins_id, postal_code: @school.postal_code, school_name: @school.school_name, school_phone: @school.school_phone, school_region: @school.school_region, standing: @school.standing, state: @school.state, status: @school.status, street2: @school.street2, street: @school.street } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { city: @school.city, country: @school.country, email: @school.email, main_ins_id: @school.main_ins_id, postal_code: @school.postal_code, school_name: @school.school_name, school_phone: @school.school_phone, school_region: @school.school_region, standing: @school.standing, state: @school.state, status: @school.status, street2: @school.street2, street: @school.street } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end
end
