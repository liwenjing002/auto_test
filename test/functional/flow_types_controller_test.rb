require 'test_helper'

class FlowTypesControllerTest < ActionController::TestCase
  setup do
    @flow_type = flow_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flow_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flow_type" do
    assert_difference('FlowType.count') do
      post :create, flow_type: { code: @flow_type.code, name: @flow_type.name }
    end

    assert_redirected_to flow_type_path(assigns(:flow_type))
  end

  test "should show flow_type" do
    get :show, id: @flow_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flow_type
    assert_response :success
  end

  test "should update flow_type" do
    put :update, id: @flow_type, flow_type: { code: @flow_type.code, name: @flow_type.name }
    assert_redirected_to flow_type_path(assigns(:flow_type))
  end

  test "should destroy flow_type" do
    assert_difference('FlowType.count', -1) do
      delete :destroy, id: @flow_type
    end

    assert_redirected_to flow_types_path
  end
end
