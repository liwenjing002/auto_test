class TestResult < ActiveRecord::Base
  attr_accessible :test_case_id, :test_plan_id, :test_result_content, :test_script_id,:test_result_flag
  belongs_to :test_case
  belongs_to :test_plan 
  belongs_to :test_script


  def self.setResult(data)

  	r = TestResult.where(" test_plan_id = #{data[:test_plan_id]} and  test_case_id = #{data[:test_case_id]} ") 
   
  	if r != nil and r.length > 0
      if data[:test_result_content] != nil
  		r[0].test_result_content = r[0].test_result_content + data[:test_result_content]
      end
  		r[0].test_result_flag = data[:test_result_flag]
      if data[:test_script_id] != nil
      r[0].test_script_id = data[:test_script_id]
      end
  		r[0].save
  	else
  		testResult = TestResult.new(data) 
		  testResult.save 
  	end
  		
  end
  
  
end
