begin 
load './test_script/28/28_596585.rb'
testResult = TestResult.new(:test_script_id=>6585,:test_plan_id=>28,:test_case_id=>59,:test_result_flag => true) 
testResult.save 
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6585,:test_plan_id=>28,:test_case_id=>59,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
