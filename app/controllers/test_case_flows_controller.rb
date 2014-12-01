# encoding: utf-8
class TestCaseFlowsController < ApplicationController

  # GET /test_case_flows
  # GET /test_case_flows.json
  def index
    @test_case_flows = TestCaseFlow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_case_flows }
    end
  end

  # GET /test_case_flows/1
  # GET /test_case_flows/1.json
  def show
    @test_case_flow = TestCaseFlow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_case_flow }
    end
  end

  # GET /test_case_flows/new
  # GET /test_case_flows/new.json
  def new
    @test_case = TestCase.find(params[:test_case_id])
    @test_case_flow = TestCaseFlow.new
    @test_case_flow.test_case_id=params[:test_case_id]
    @test_case_flow.flow_seq = params[:seq]?params[:seq] +1 : 1
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_case_flow }
    end
  end

  # GET /test_case_flows/1/edit
  def edit
    @test_case_flow = TestCaseFlow.find(params[:id])
  end

  # POST /test_case_flows
  # POST /test_case_flows.json
  def create
    @test_case_flow = TestCaseFlow.new(params[:test_case_flow])
    
    respond_to do |format|

      testFlowOld = TestCaseFlow.where("test_case_id = ? and flow_seq = ? ",@test_case_flow.test_case_id,@test_case_flow.flow_seq)
      
      testFlowLast = TestCaseFlow.where("test_case_id = ?",@test_case_flow.test_case_id).order("flow_seq desc").first


      if testFlowOld.length == 0 and @test_case_flow.save
        @test_case_flow_new = TestCaseFlow.new
        @test_case_flow_new.test_case_id= @test_case_flow.test_case_id
      
        if testFlowLast != nil
        @test_case_flow_new.flow_seq = testFlowLast.flow_seq + 1
        else
        @test_case_flow_new.flow_seq = @test_case_flow.flow_seq + 1  
        end
        @test_case_flow_new.save

        #不新增一行
        if params[:commit] == '保存'
          @test_case_flow_new= nil
        end

        format.js { render :layout => false }
        format.html { redirect_to @test_case_flow, notice: 'Test case flow was successfully created.' }
        format.json { render json: @test_case_flow, status: :created, location: @test_case_flow }
      else
        testFlowOld[0].update_attributes(params[:test_case_flow])
        #不新增一行
        if params[:commit] == '保存'
          @test_case_flow_new= nil
        end
        format.js { render :layout => false }
        format.html { render action: "new" }
        format.json { render json: @test_case_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_case_flows/1
  # PUT /test_case_flows/1.json
  def update
    @test_case_flow = TestCaseFlow.find(params[:id])
    testFlowLast = TestCaseFlow.where("test_case_id = ?",@test_case_flow.test_case_id).order("flow_seq desc").first
    @test_case_flow_new = TestCaseFlow.new
    @test_case_flow_new.test_case_id= @test_case_flow.test_case_id


    @test_case_flow_new.flow_seq = testFlowLast.flow_seq + 1
    
    if params[:commit] == '保存并插入'
      @test_case_flow_new.flow_seq = @test_case_flow.flow_seq + 1

      need_change_seq = TestCaseFlow.where("test_case_id = ? and flow_seq > ?",@test_case_flow.test_case_id,@test_case_flow.flow_seq)

      need_change_seq.each do |n|
        n.flow_seq = n.flow_seq + 1
        n.save
      end

    end

    @test_case_flow_new.save
    respond_to do |format|
      if @test_case_flow.update_attributes(params[:test_case_flow])
          #不新增一行
        if params[:commit] == "保存"
          @test_case_flow_new= nil
        end
        format.js { render :layout => false }
        format.html { redirect_to @test_case_flow, notice: 'Test case flow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_case_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_case_flows/1
  # DELETE /test_case_flows/1.json
  def destroy
    @test_case_flow = TestCaseFlow.find(params[:id])

    @seq = @test_case_flow.flow_seq
    @test_case_flow.destroy

    respond_to do |format|
      format.js { render :layout => false }
    end
  end
end
