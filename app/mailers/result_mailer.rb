# encoding: utf-8
class ResultMailer < ActionMailer::Base
  default from: "liwenjingabc@126.com"


   def send_mail(send_to,test_plan_id)  

    @test_plan = TestPlan.find(test_plan_id)

    @test_results = @test_plan.test_results

    mail( :subject => (@test_plan.name + "：测试结果"),   
          :to => send_to,   
          :from => 'liwenjingabc@126.com',   
          :date => Time.now  
        )   
   end 
end
