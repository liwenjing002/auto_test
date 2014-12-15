class TestPlanData < ActiveRecord::Base
  attr_accessible :test_case_flow_id, :test_plan_id,:test_data,:flow_date_type_id
  belongs_to :flow_date_type
end
