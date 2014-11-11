require 'fileutils'
class TestPlan < ActiveRecord::Base
	attr_accessible :host, :user_name,:log_path, :name, :pd,:test_num


   	has_many :test_plan_cases, :dependent => :destroy
   	has_many :test_cases , :through=>:test_plan_cases
   	has_many :test_scripts, :dependent => :destroy
   	has_many :test_plan_datas, :dependent => :destroy
    has_many :test_results, :dependent => :destroy

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
        control_file.write "rescue Exception => e \r\n"
        control_file.write "testResult = TestResult.new(:test_script_id=>" + test_script.id.to_s + ",:test_plan_id=>" + test_script.test_plan_id.to_s + ",:test_case_id=>" + test_script.test_case_id.to_s  + ",:test_result_content=>e.message,:test_result_flag => false) \r\n"
        control_file.write "testResult.save \r\n"
        control_file.write "end \r\n"

   			scriptFile.close
  		end
  		control_file.close
   	end


   	def excuse
		load "./test_script/" + self.id.to_s + "/" + self.id.to_s + "_control.rb"
   	end

    def get_error_cast_num
     return  TestResult.where("test_plan_id = ?",id).length
    end

end
