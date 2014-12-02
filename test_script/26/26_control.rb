begin 
load './test_script/26/26_636572.rb'
testResult = TestResult.new(:test_script_id=>6572,:test_plan_id=>26,:test_case_id=>63,:test_result_flag => true) 
testResult.save 
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6572,:test_plan_id=>26,:test_case_id=>63,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
