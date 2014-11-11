class TestPlanCasesController < ApplicationController
  # GET /test_plan_cases
  # GET /test_plan_cases.json
  def index
    @test_plan_cases = TestPlanCase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_plan_cases }
    end
  end

  # GET /test_plan_cases/1
  # GET /test_plan_cases/1.json
  def show
    @test_plan_case = TestPlanCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_plan_case }
    end
  end

  # GET /test_plan_cases/new
  # GET /test_plan_cases/new.json
  def new
     @test_plan = TestPlan.find(params[:test_plan_id])
    @test_plan_case = TestPlanCase.new
    @test_plan_case.test_plan_id = params[:test_plan_id]
    @test_cases = TestCase.all

    @test_cases.each do|test_case|
       test_plan_cases = TestPlanCase.where("test_case_id = ? and test_plan_id = ? ", test_case.id,params[:test_plan_id])
      if test_plan_cases.length > 0
        test_case.selected = true
      end

    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_plan_case }
    end
  end

  # GET /test_plan_cases/1/edit
  def edit
    @test_plan_case = TestPlanCase.find(params[:id])
  end

  # POST /test_plan_cases
  # POST /test_plan_cases.json
  def create
    @test_plan_case = TestPlanCase.new(params[:test_plan_case])

    respond_to do |format|
      if @test_plan_case.save
        format.html { redirect_to @test_plan_case, notice: 'Test plan case was successfully created.' }
        format.json { render json: @test_plan_case, status: :created, location: @test_plan_case }
      else
        format.html { render action: "new" }
        format.json { render json: @test_plan_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_plan_cases/1
  # PUT /test_plan_cases/1.json
  def update
    @test_plan_case = TestPlanCase.find(params[:id])

    respond_to do |format|
      if @test_plan_case.update_attributes(params[:test_plan_case])
        format.html { redirect_to @test_plan_case, notice: 'Test plan case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_plan_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_plan_cases/1
  # DELETE /test_plan_cases/1.json
  def destroy
    @test_plan_cases = TestPlanCase.where("test_case_id = ? and test_plan_id = ? ", params[:test_plan_case][:test_case_id],params[:test_plan_case][:test_plan_id])
    
    @test_plan_cases.each do |test_plan_case|
      test_plan_case.destroy
    end



    respond_to do |format|
      format.html { redirect_to test_plan_cases_url }
      format.json { render json: @test_plan_case, status: :created, location: @test_plan_case }
      format.json { head :no_content }
    end
  end



  def get_data

    @test_case = TestCase.find(params[:test_case_id])
    respond_to do |format|
        format.js { render :layout => false }
    end
  end


  def set_data
    testdatas = TestPlanData.where("test_case_flow_id = ? and test_plan_id = ? ",
        params[:test_plan_data][:test_case_flow_id],params[:test_plan_data][:test_plan_id])

    testdatas.each do|data|
      data.destroy

    end

    @test_plan_data = TestPlanData.new(params[:test_plan_data])
    @test_plan_data.save
    respond_to do |format|
        format.js { render :layout => false }
    end
  end

end
