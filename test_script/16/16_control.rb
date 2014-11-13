begin 
load './test_script/16/16_346226.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6226,:test_plan_id=>16,:test_case_id=>34,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
