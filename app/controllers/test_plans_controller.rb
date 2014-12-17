# encoding: utf-8
class TestPlansController < ApplicationController

  # GET /test_plans
  # GET /test_plans.json
  def index

    @test_plans = TestPlan.where("1=1") 
    @test_plans = @test_plans.where("name like '%#{params[:title].strip}%'") if params[:title]  and params[:title] !=""
    @test_plans = @test_plans.where("user_id = #{params[:user_id]} ") if params[:user_id] and params[:user_id] !=""
    @test_plans = @test_plans.paginate :page => params[:page]||1,
                            :per_page=>10,
                            :order => 'created_at DESC'
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


  def clean_test_plan test_plan
    test_plan.time_at = ''
    test_plan.time_cron = ''
    test_plan.time_every = ''
    test_plan.time_after = ''
    return test_plan
  end


def clean_param params
     params[:test_plan][:time_at] = '' 
     params[:test_plan][:time_cron] ='' 
     params[:test_plan][:time_every] = '' 
     params[:test_plan][:time_after] = '' 
  end


  # POST /test_plans
  # POST /test_plans.json
  def create
    @test_plan = TestPlan.new(params[:test_plan])

    time_select = params[:test_plan][:time_select]
    params[:test_plan].delete(:time_select) 



    if time_select =='1'
       @test_plan = clean_test_plan @test_plan
       @test_plan.time_cron = params[:test_plan][:time_cron]
    end

    if time_select =='2'
    d = Date.civil(params[:time_at][:year].to_i, params[:time_at][:month].to_i, params[:time_at][:day].to_i)

    @test_plan = clean_test_plan @test_plan
    @test_plan.time_at = d.strftime("%Y/%m/%d %H:%M:%S")
    end

    if time_select =='3'
       @test_plan = clean_test_plan @test_plan
       @test_plan.time_after = params[:test_plan][:time_after]
    end

    if time_select =='4'
       @test_plan = clean_test_plan @test_plan
       @test_plan.time_every = params[:test_plan][:time_every]
    end



    @test_plan.user_id = current_user.id
    respond_to do |format|
      if @test_plan.save
        format.html { redirect_to new_test_plan_case_path(:test_plan_id=>@test_plan.id), notice: 'Test case was successfully created.' }
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

    time_select = params[:test_plan][:time_select]
    params[:test_plan].delete(:time_select) 

   

    if time_select =='1'
       @test_plan.time_cron = params[:test_plan][:time_cron]
       clean_param params
       params[:test_plan][:time_cron] = @test_plan.time_cron
    end

    if time_select =='2'
    d = Date.civil(params[:time_at][:year].to_i, params[:time_at][:month].to_i, params[:time_at][:day].to_i)

    clean_param @test_plan
    @test_plan.time_at = d.strftime("%Y/%m/%d %H:%M:%S")
    params[:test_plan][:time_at] = @test_plan.time_at

    end

    if time_select =='3'
       @test_plan.time_after = params[:test_plan][:time_after]
       clean_param params
       params[:test_plan][:time_after] = @test_plan.time_after

    end

    if time_select =='4'

       @test_plan.time_every = params[:test_plan][:time_every]
       clean_param params
       params[:test_plan][:time_every] = @test_plan.time_every
    end

    @test_plan.user_id = current_user.id


    puts "----------------------------------------------------------------------------------------------"
    puts params[:test_plan]

    respond_to do |format|
      if @test_plan.user_id == current_user.id && @test_plan.update_attributes(params[:test_plan])
        format.html { redirect_to new_test_plan_case_path(:test_plan_id=>@test_plan.id), notice: 'Test case was successfully created.' }
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
       format.js { render :layout => false }
      format.json { head :no_content }
    end
  end

  def excuse
    @test_plan = TestPlan.find(params[:id])

     TestResult.delete_all("test_plan_id = #{@test_plan.id}")

     Thread.new  do  
     
     
      job_id = ""


    if @test_plan.time_after != nil  and @test_plan.time_after != ''
      after_sec = @test_plan.time_after
      job_id = $scheduler.in after_sec.to_s do
        @test_plan.excuse
      end 
     end

     if @test_plan.time_at != nil  and @test_plan.time_at != ''
      time_at = @test_plan.time_at
      job_id = $scheduler.at time_at.to_s do
        @test_plan.excuse
      end 
     end


     if @test_plan.time_cron != nil  and @test_plan.time_cron != ''
      time_cron = @test_plan.time_cron
      job_id = $scheduler.cron time_cron.to_s do
        @test_plan.excuse
      end 
     end


     if @test_plan.time_every != nil and @test_plan.time_every != '' 
      every_sec = @test_plan.time_every.to_i * 60

      job_id = $scheduler.every every_sec.to_s do
        @test_plan.excuse
      end 
     end

     
     if job_id != ''
      puts job_id
      @test_plan.job_id =  job_id
      @test_plan.job_status = '运行中'
      @test_plan.save
      $scheduler.join
    end
     
     if(@test_plan.time_select == 0)
      @test_plan.excuse

     end

      


      
      end
    
     respond_to do |format|
      format.html { redirect_to test_plans_url }
       format.js { render :layout => false }
      format.json { head :no_content }
    end
  end



  def pause
    @test_plan = TestPlan.find(params[:id])



    job = $scheduler.job(@test_plan.job_id)
    if job !=nil
    puts job 
    puts "-======================================================================================================================" 
    puts job.paused? 
    job.pause
     puts job.paused? 
     puts "-======================================================================================================================" 
    end
     respond_to do |format|
      format.html { redirect_to test_plans_url }
       format.js { render :layout => false }
      format.json { head :no_content }
    end
  end


def resume
    @test_plan = TestPlan.find(params[:id])
    job = $scheduler.job(@test_plan.job_id)
    if job !=nil
    job = $scheduler.job(@test_plan.job_id)
    puts job 
    job.resume
    end
    
     respond_to do |format|
      format.html { redirect_to test_plans_url }
       format.js { render :layout => false }
      format.json { head :no_content }
    end
  end


  def stop
    @test_plan = TestPlan.find(params[:id])
    job = $scheduler.job(@test_plan.job_id)
    if job !=nil
     $scheduler.unschedule(@test_plan.job_id)
   end
    
     respond_to do |format|
      format.html { redirect_to test_plans_url }
       format.js { render :layout => false }
      format.json { head :no_content }
    end
  end




  def pro
      @test_plan = TestPlan.find(params[:id])

      testScript = TestScript.new 

      testScript.db_plan_script(@test_plan)

      @test_plan.file_script

      respond_to do |format|
      format.html { redirect_to test_plans_url }
       format.js { render :layout => false }
      format.json { head :no_content }
    end

  end


  def result

  @test_plan = TestPlan.find(params[:id])

  @test_results = @test_plan.test_results

  end


  def script

    @testScript = TestScript.find(params[:id])

  end


end
