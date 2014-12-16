class FlowDateTypesController < ApplicationController
  check_authorization
  load_and_authorize_resource
  # GET /flow_date_types
  # GET /flow_date_types.json
  def index
    @flow_date_types = FlowDateType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flow_date_types }
    end
  end

  # GET /flow_date_types/1
  # GET /flow_date_types/1.json
  def show
    @flow_date_type = FlowDateType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flow_date_type }
    end
  end

  # GET /flow_date_types/new
  # GET /flow_date_types/new.json
  def new
    @flow_date_type = FlowDateType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flow_date_type }
    end
  end

  # GET /flow_date_types/1/edit
  def edit
    @flow_date_type = FlowDateType.find(params[:id])
  end

  # POST /flow_date_types
  # POST /flow_date_types.json
  def create
    @flow_date_type = FlowDateType.new(params[:flow_date_type])

    respond_to do |format|
      if @flow_date_type.save
        format.html { redirect_to @flow_date_type, notice: 'Flow date type was successfully created.' }
        format.json { render json: @flow_date_type, status: :created, location: @flow_date_type }
      else
        format.html { render action: "new" }
        format.json { render json: @flow_date_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flow_date_types/1
  # PUT /flow_date_types/1.json
  def update
    @flow_date_type = FlowDateType.find(params[:id])

    respond_to do |format|
      if @flow_date_type.update_attributes(params[:flow_date_type])
        format.html { redirect_to @flow_date_type, notice: 'Flow date type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flow_date_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flow_date_types/1
  # DELETE /flow_date_types/1.json
  def destroy
    @flow_date_type = FlowDateType.find(params[:id])
    @flow_date_type.destroy

    respond_to do |format|
      format.html { redirect_to flow_date_types_url }
      format.json { head :no_content }
    end
  end
end
