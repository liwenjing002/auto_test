begin 
load './test_script/14/14_286216.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6216,:test_plan_id=>14,:test_case_id=>28,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
