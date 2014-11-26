begin 
load './test_script/23/23_496355.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6355,:test_plan_id=>23,:test_case_id=>49,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/23/23_496356.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6356,:test_plan_id=>23,:test_case_id=>49,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/23/23_496357.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6357,:test_plan_id=>23,:test_case_id=>49,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
