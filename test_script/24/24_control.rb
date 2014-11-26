begin 
load './test_script/24/24_516457.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6457,:test_plan_id=>24,:test_case_id=>51,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
