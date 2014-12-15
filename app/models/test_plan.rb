# encoding: utf-8
require 'fileutils'
class TestPlan < ActiveRecord::Base
	attr_accessible :host, :user_name,:log_path, :name, :pd,:test_num,:user_id,:memo,:time_after,:time_every,:time_at,:time_cron,:job_id,:job_sstatus


   	has_many :test_plan_cases, :dependent => :destroy
   	has_many :test_cases , :through=>:test_plan_cases
   	has_many :test_scripts, :dependent => :destroy
   	has_many :test_plan_datas, :dependent => :destroy
    has_many :test_results, :dependent => :destroy
    belongs_to :user  

   	def file_script
   		path = "./test_script/" + self.id.to_s 
   		control_file_path = path + "/" + self.id.to_s + "_control.rb"
   		if  File.exist? path
   			FileUtils.rm_rf path	
   		end
		Dir.mkdir(path)
   		
		control_file = File.new(control_file_path,"w")

   		self.test_scripts.each do |test_script|
   			name = path + '/' + test_script.test_plan_id.to_s + "_" + test_script.test_case_id.to_s + 
  				 test_script.id.to_s +  ".rb" 
  			scriptFile = File.new(name,"w")
  			scriptFile.write test_script.script_content 

        control_file.write "begin \r\n"
  			control_file.write "load \'" + name + "\'\r\n"

        control_file.write "testResult = TestResult.setResult(:test_script_id=>" + test_script.id.to_s + ",:test_plan_id=>" + test_script.test_plan_id.to_s + ",:test_case_id=>" + test_script.test_case_id.to_s  + ",:test_result_flag => true) \r\n"

        control_file.write "rescue Exception => e \r\n"
        control_file.write "testResult = TestResult.setResult(:test_script_id=>" + test_script.id.to_s + ",:test_plan_id=>" + test_script.test_plan_id.to_s + ",:test_case_id=>" + test_script.test_case_id.to_s  + ",:test_result_content=>e.message,:test_result_flag => false) \r\n"
        control_file.write "end \r\n"

   			scriptFile.close
  		end
  		control_file.close
   	end


   	def excuse
		load "./test_script/" + self.id.to_s + "/" + self.id.to_s + "_control.rb"
    ResultMailer.send_mail(self.user.email,self.id).deliver
   	end

    def get_error_cast_num
     return  TestResult.where("test_plan_id = ? and test_result_flag = ? ",id,false).length
    end



    def get_job_status
     
      job = $scheduler.job(self.job_id)

      if job !=nil
        if job.paused?
          if self.job_status !='暂停中'
            self.job_status = '暂停中'
            self.save
          end
          return "暂停中"
        else
           if self.job_status !='运行中'
            self.job_status = '运行中'
            self.save
          end
           return "运行中"
        end
      else
        if self.job_status !='停止'
            self.job_status = '停止'
            self.save
          end
        return "停止"  
      end

    end

end
