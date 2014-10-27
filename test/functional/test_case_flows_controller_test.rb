require 'test_helper'

class TestCaseFlowsControllerTest < ActionController::TestCase
  setup do
    @test_case_flow = test_case_flows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_case_flows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_case_flow" do
    assert_difference('TestCaseFlow.count') do
      post :create, test_case_flow: { flow_date: @test_case_flow.flow_date, flow_date_type_id: @test_case_flow.flow_date_type_id, flow_location: @test_case_flow.flow_location, flow_seq: @test_case_flow.flow_seq, flow_type_id: @test_case_flow.flow_type_id, test_case_id: @test_case_flow.test_case_id }
    end

    assert_redirected_to test_case_flow_path(assigns(:test_case_flow))
  end

  test "should show test_case_flow" do
    get :show, id: @test_case_flow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_case_flow
    assert_response :success
  end

  test "should update test_case_flow" do
    put :update, id: @test_case_flow, test_case_flow: { flow_date: @test_case_flow.flow_date, flow_date_type_id: @test_case_flow.flow_date_type_id, flow_location: @test_case_flow.flow_location, flow_seq: @test_case_flow.flow_seq, flow_type_id: @test_case_flow.flow_type_id, test_case_id: @test_case_flow.test_case_id }
    assert_redirected_to test_case_flow_path(assigns(:test_case_flow))
  end

  test "should destroy test_case_flow" do
    assert_difference('TestCaseFlow.count', -1) do
      delete :destroy, id: @test_case_flow
    end

    assert_redirected_to test_case_flows_path
  end
end
