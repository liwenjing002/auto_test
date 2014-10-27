require 'test_helper'

class FlowDateTypesControllerTest < ActionController::TestCase
  setup do
    @flow_date_type = flow_date_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flow_date_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flow_date_type" do
    assert_difference('FlowDateType.count') do
      post :create, flow_date_type: { code: @flow_date_type.code, name: @flow_date_type.name }
    end

    assert_redirected_to flow_date_type_path(assigns(:flow_date_type))
  end

  test "should show flow_date_type" do
    get :show, id: @flow_date_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flow_date_type
    assert_response :success
  end

  test "should update flow_date_type" do
    put :update, id: @flow_date_type, flow_date_type: { code: @flow_date_type.code, name: @flow_date_type.name }
    assert_redirected_to flow_date_type_path(assigns(:flow_date_type))
  end

  test "should destroy flow_date_type" do
    assert_difference('FlowDateType.count', -1) do
      delete :destroy, id: @flow_date_type
    end

    assert_redirected_to flow_date_types_path
  end
end
