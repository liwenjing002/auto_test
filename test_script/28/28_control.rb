begin 
load './test_script/28/28_596565.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6565,:test_plan_id=>28,:test_case_id=>59,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/28/28_626566.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6566,:test_plan_id=>28,:test_case_id=>62,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/28/28_606567.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6567,:test_plan_id=>28,:test_case_id=>60,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
