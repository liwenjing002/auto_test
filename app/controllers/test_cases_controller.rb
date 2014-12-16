class TestCasesController < ApplicationController
  check_authorization
  load_and_authorize_resource
  # GET /test_cases
  # GET /test_cases.json
  def index

    @test_cases = TestCase.where("1=1") 
    @test_cases = @test_cases.where("title like '%#{params[:title].strip}%'") if params[:title]  and params[:title] !=""
    @test_cases = @test_cases.where("user_id = #{params[:user_id]} ") if params[:user_id] and params[:user_id] !=""
    @test_cases = @test_cases.paginate :page => params[:page]||1,
                            :per_page=>10,
                            :order => 'created_at DESC'


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_cases }
    end
  end

  # GET /test_cases/1
  # GET /test_cases/1.json
  def show
    @test_case = TestCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_case }
    end
  end

  # GET /test_cases/new
  # GET /test_cases/new.json
  def new
    @test_case = TestCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_case }
    end
  end

  # GET /test_cases/1/edit
  def edit
    @test_case = TestCase.find(params[:id])
  end

  # POST /test_cases
  # POST /test_cases.json
  def create
    @test_case = TestCase.new(params[:test_case])
    @test_case.user_id = current_user.id
    respond_to do |format|
      if @test_case.save
        format.html { redirect_to new_test_case_flow_path(:test_case_id=>@test_case.id), notice: 'Test case was successfully created.' }
        format.json { render json: @test_case, status: :created, location: @test_case }
      else
        format.html { render action: "new" }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_cases/1
  # PUT /test_cases/1.json
  def update
    @test_case = TestCase.find(params[:id])
   
    respond_to do |format|

      if @test_case.user_id.to_s == current_user.id.to_s && @test_case.update_attributes(params[:test_case])
        format.html { redirect_to @test_case, notice: 'Test case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_cases/1
  # DELETE /test_cases/1.json
  def destroy
    @test_case = TestCase.find(params[:id])
    @test_case.destroy
    respond_to do |format|
      format.html { redirect_to test_cases_url }
      format.js { render :layout => false }
      format.json { head :no_content }
    end
  end



  #生成脚本
  def pro
    @test_case = TestCase.find(params[:id])
    @test_script = TestScript.new
    @test_script.test_case_id = @test_case.id
    @test_script.db_script @test_case

    @test_case = TestCase.find(params[:id])
    @test_script.file_script @test_case

      respond_to do |format|
      format.html { redirect_to test_cases_url }
      format.js { render :layout => false }
      format.json { head :no_content }
    end

  end

  def excuse
    
    @test_case = TestCase.find(params[:id])
    @test_case.test_scripts.each do |test_script|
     
       Thread.new  do  
           test_script.excuse
       end  

    end

      respond_to do |format|
      format.html { redirect_to test_cases_url }
      format.json { head :no_content }
      format.js { render :layout => false }
    end

  end


end
