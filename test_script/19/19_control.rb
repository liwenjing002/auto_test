begin 
load './test_script/19/19_396297.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6297,:test_plan_id=>19,:test_case_id=>39,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/19/19_396298.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6298,:test_plan_id=>19,:test_case_id=>39,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/19/19_396299.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6299,:test_plan_id=>19,:test_case_id=>39,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
