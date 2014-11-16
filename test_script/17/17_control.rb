begin 
load './test_script/17/17_396256.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6256,:test_plan_id=>17,:test_case_id=>39,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/17/17_396257.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6257,:test_plan_id=>17,:test_case_id=>39,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/17/17_396258.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6258,:test_plan_id=>17,:test_case_id=>39,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/17/17_396259.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6259,:test_plan_id=>17,:test_case_id=>39,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
