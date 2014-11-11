class TestResult < ActiveRecord::Base
  attr_accessible :test_case_id, :test_plan_id, :test_result_content, :test_script_id,:test_result_flag
  belongs_to :test_case
  belongs_to :test_plan 
  belongs_to :test_script



  
  
end
