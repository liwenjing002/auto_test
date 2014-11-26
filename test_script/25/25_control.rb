begin 
load './test_script/25/25_526436.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6436,:test_plan_id=>25,:test_case_id=>52,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/25/25_526437.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6437,:test_plan_id=>25,:test_case_id=>52,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/25/25_526438.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6438,:test_plan_id=>25,:test_case_id=>52,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
begin 
load './test_script/25/25_526439.rb'
rescue Exception => e 
testResult = TestResult.new(:test_script_id=>6439,:test_plan_id=>25,:test_case_id=>52,:test_result_content=>e.message,:test_result_flag => false) 
testResult.save 
end 
