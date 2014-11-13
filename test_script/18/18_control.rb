begin 
load './test_script/18/18_376247.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6247,:test_plan_id=>18,:test_case_id=>37,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
