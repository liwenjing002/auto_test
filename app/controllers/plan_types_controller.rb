class PlanTypesController < ApplicationController
  before_filter :set_plan_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @plan_types = PlanType.all
    respond_with(@plan_types)
  end

  def show
    respond_with(@plan_type)
  end

  def new
    @plan_type = PlanType.new
    respond_with(@plan_type)
  end

  def edit
  end

  def create
    @plan_type = PlanType.new(params[:plan_type])
    @plan_type.save
    respond_with(@plan_type)
  end

  def update
    @plan_type.update_attributes(params[:plan_type])
    respond_with(@plan_type)
  end

  def destroy
    @plan_type.destroy
    respond_with(@plan_type)
  end

  private
    def set_plan_type
      @plan_type = PlanType.find(params[:id])
    end
end
