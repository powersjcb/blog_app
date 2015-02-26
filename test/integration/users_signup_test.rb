require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: "",
                              email: "user@invalid",
                              password: 'foo',
                              password_confirmation: 'bar'}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end


  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path user: {name: "Test Name",
                            email: "user@valid.com",
                            password: "foobar",
                            password_confirmation: "foobar"}
    end
    assert_template @user
    assert_not flash.nil?
  end
end