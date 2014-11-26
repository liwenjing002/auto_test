begin 
load './test_script/26/26_546464.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6464,:test_plan_id=>26,:test_case_id=>54,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/26/26_546465.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6465,:test_plan_id=>26,:test_case_id=>54,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/26/26_546466.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6466,:test_plan_id=>26,:test_case_id=>54,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/26/26_546467.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6467,:test_plan_id=>26,:test_case_id=>54,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
