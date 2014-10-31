require 'test_helper'

class TestPlansControllerTest < ActionController::TestCase
  setup do
    @test_plan = test_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_plan" do
    assert_difference('TestPlan.count') do
      post :create, test_plan: { host: @test_plan.host, log_path: @test_plan.log_path, name: @test_plan.name, pd: @test_plan.pd }
    end

    assert_redirected_to test_plan_path(assigns(:test_plan))
  end

  test "should show test_plan" do
    get :show, id: @test_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_plan
    assert_response :success
  end

  test "should update test_plan" do
    put :update, id: @test_plan, test_plan: { host: @test_plan.host, log_path: @test_plan.log_path, name: @test_plan.name, pd: @test_plan.pd }
    assert_redirected_to test_plan_path(assigns(:test_plan))
  end

  test "should destroy test_plan" do
    assert_difference('TestPlan.count', -1) do
      delete :destroy, id: @test_plan
    end

    assert_redirected_to test_plans_path
  end
end
