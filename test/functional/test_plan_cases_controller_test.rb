require 'test_helper'

class TestPlanCasesControllerTest < ActionController::TestCase
  setup do
    @test_plan_case = test_plan_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_plan_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_plan_case" do
    assert_difference('TestPlanCase.count') do
      post :create, test_plan_case: { test_case_id: @test_plan_case.test_case_id, test_plan_id: @test_plan_case.test_plan_id }
    end

    assert_redirected_to test_plan_case_path(assigns(:test_plan_case))
  end

  test "should show test_plan_case" do
    get :show, id: @test_plan_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_plan_case
    assert_response :success
  end

  test "should update test_plan_case" do
    put :update, id: @test_plan_case, test_plan_case: { test_case_id: @test_plan_case.test_case_id, test_plan_id: @test_plan_case.test_plan_id }
    assert_redirected_to test_plan_case_path(assigns(:test_plan_case))
  end

  test "should destroy test_plan_case" do
    assert_difference('TestPlanCase.count', -1) do
      delete :destroy, id: @test_plan_case
    end

    assert_redirected_to test_plan_cases_path
  end
end
