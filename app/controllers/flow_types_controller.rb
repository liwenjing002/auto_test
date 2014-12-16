class FlowTypesController < ApplicationController
  check_authorization
  load_and_authorize_resource
  # GET /flow_types
  # GET /flow_types.json
  def index
    @flow_types = FlowType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flow_types }
    end
  end

  # GET /flow_types/1
  # GET /flow_types/1.json
  def show
    @flow_type = FlowType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flow_type }
    end
  end

  # GET /flow_types/new
  # GET /flow_types/new.json
  def new
    @flow_type = FlowType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flow_type }
    end
  end

  # GET /flow_types/1/edit
  def edit
    @flow_type = FlowType.find(params[:id])
  end

  # POST /flow_types
  # POST /flow_types.json
  def create
    @flow_type = FlowType.new(params[:flow_type])

    respond_to do |format|
      if @flow_type.save
        format.html { redirect_to @flow_type, notice: 'Flow type was successfully created.' }
        format.json { render json: @flow_type, status: :created, location: @flow_type }
      else
        format.html { render action: "new" }
        format.json { render json: @flow_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flow_types/1
  # PUT /flow_types/1.json
  def update
    @flow_type = FlowType.find(params[:id])

    respond_to do |format|
      if @flow_type.update_attributes(params[:flow_type])
        format.html { redirect_to @flow_type, notice: 'Flow type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flow_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flow_types/1
  # DELETE /flow_types/1.json
  def destroy
    @flow_type = FlowType.find(params[:id])
    @flow_type.destroy

    respond_to do |format|
      format.html { redirect_to flow_types_url }
      format.json { head :no_content }
    end
  end
end
