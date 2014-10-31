class TestPlansController < ApplicationController
  # GET /test_plans
  # GET /test_plans.json
  def index
    @test_plans = TestPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_plans }
    end
  end

  # GET /test_plans/1
  # GET /test_plans/1.json
  def show
    @test_plan = TestPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_plan }
    end
  end

  # GET /test_plans/new
  # GET /test_plans/new.json
  def new
    @test_plan = TestPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_plan }
    end
  end

  # GET /test_plans/1/edit
  def edit
    @test_plan = TestPlan.find(params[:id])
  end

  # POST /test_plans
  # POST /test_plans.json
  def create
    @test_plan = TestPlan.new(params[:test_plan])

    respond_to do |format|
      if @test_plan.save
        format.html { redirect_to @test_plan, notice: 'Test plan was successfully created.' }
        format.json { render json: @test_plan, status: :created, location: @test_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @test_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_plans/1
  # PUT /test_plans/1.json
  def update
    @test_plan = TestPlan.find(params[:id])

    respond_to do |format|
      if @test_plan.update_attributes(params[:test_plan])
        format.html { redirect_to @test_plan, notice: 'Test plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_plans/1
  # DELETE /test_plans/1.json
  def destroy
    @test_plan = TestPlan.find(params[:id])
    @test_plan.destroy

    respond_to do |format|
      format.html { redirect_to test_plans_url }
      format.json { head :no_content }
    end
  end
end
