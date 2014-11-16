begin 
load './test_script/21/21_346295.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6295,:test_plan_id=>21,:test_case_id=>34,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
