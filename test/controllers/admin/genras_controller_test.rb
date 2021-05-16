require 'test_helper'

class Admin::GenrasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_genras_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_genras_edit_url
    assert_response :success
  end

end
