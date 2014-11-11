class TestPlanCase < ActiveRecord::Base
  attr_accessible :test_case_id, :test_plan_id
  belongs_to :test_case
  belongs_to :test_plan 
end
