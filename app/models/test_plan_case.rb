class TestPlanCase < ActiveRecord::Base
  attr_accessible :test_case_id, :test_plan_id
  has_many :test_cases
end
