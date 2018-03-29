require 'test_helper'

class InformationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @information = information(:one)
  end

  test "should get index" do
    get information_index_url
    assert_response :success
  end

  test "should get new" do
    get new_information_url
    assert_response :success
  end

  test "should create information" do
    assert_difference('Information.count') do
      post information_index_url, params: { information: { age: @information.age, birthdate: @information.birthdate, body_issues: @information.body_issues, city: @information.city, class_group: @information.class_group, country: @information.country, date_visited: @information.date_visited, email: @information.email, first_name: @information.first_name, home_phone: @information.home_phone, how_found: @information.how_found, interest: @information.interest, last_name: @information.last_name, mobile_phone: @information.mobile_phone, notes: @information.notes, occupation: @information.occupation, parental_contact: @information.parental_contact, postal_code: @information.postal_code, school_id: @information.school_id, state: @information.state, street2: @information.street2, street: @information.street } }
    end

    assert_redirected_to information_url(Information.last)
  end

  test "should show information" do
    get information_url(@information)
    assert_response :success
  end

  test "should get edit" do
    get edit_information_url(@information)
    assert_response :success
  end

  test "should update information" do
    patch information_url(@information), params: { information: { age: @information.age, birthdate: @information.birthdate, body_issues: @information.body_issues, city: @information.city, class_group: @information.class_group, country: @information.country, date_visited: @information.date_visited, email: @information.email, first_name: @information.first_name, home_phone: @information.home_phone, how_found: @information.how_found, interest: @information.interest, last_name: @information.last_name, mobile_phone: @information.mobile_phone, notes: @information.notes, occupation: @information.occupation, parental_contact: @information.parental_contact, postal_code: @information.postal_code, school_id: @information.school_id, state: @information.state, street2: @information.street2, street: @information.street } }
    assert_redirected_to information_url(@information)
  end

  test "should destroy information" do
    assert_difference('Information.count', -1) do
      delete information_url(@information)
    end

    assert_redirected_to information_index_url
  end
end
