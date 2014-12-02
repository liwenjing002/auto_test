begin 
load './test_script/28/28_596573.rb'
testResult = TestResult.new(:test_script_id=>6573,:test_plan_id=>28,:test_case_id=>59,:test_result_flag => true) 
testResult.save 
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6573,:test_plan_id=>28,:test_case_id=>59,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/28/28_626574.rb'
testResult = TestResult.new(:test_script_id=>6574,:test_plan_id=>28,:test_case_id=>62,:test_result_flag => true) 
testResult.save 
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6574,:test_plan_id=>28,:test_case_id=>62,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/28/28_606575.rb'
testResult = TestResult.new(:test_script_id=>6575,:test_plan_id=>28,:test_case_id=>60,:test_result_flag => true) 
testResult.save 
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6575,:test_plan_id=>28,:test_case_id=>60,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
