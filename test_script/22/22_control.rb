begin 
load './test_script/22/22_466487.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6487,:test_plan_id=>22,:test_case_id=>46,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/22/22_466488.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6488,:test_plan_id=>22,:test_case_id=>46,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/22/22_466489.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6489,:test_plan_id=>22,:test_case_id=>46,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/22/22_466490.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6490,:test_plan_id=>22,:test_case_id=>46,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
