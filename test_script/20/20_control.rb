begin 
load './test_script/20/20_346293.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6293,:test_plan_id=>20,:test_case_id=>34,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
