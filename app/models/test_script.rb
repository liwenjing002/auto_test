class TestScript < ActiveRecord::Base
  attr_accessible :script_content, :test_case_id, :test_plan_id


  before_destroy :rm_file


  def rm_file
  	if File::exists?("./test_script/" + self.test_case_id.to_s + "_" + self.id.to_s +  ".rb")
  		File.delete( "./test_script/" + self.test_case_id.to_s + "_" + self.id.to_s +  ".rb")
  	end

  end


  def db_script(test_case)

  		test_case.test_scripts.each do |test_script|
  			test_script.destroy
  		end

    self.script_content =  '#encoding: utf-8'  + "\n"
		self.script_content = script_content   + 'require \'watir-webdriver\' '  + "\n"

    self.script_content = script_content   + '$LOAD_PATH.unshift(File.dirname(__FILE__))'  + "\n"
    self.script_content = script_content   + 'require  \'base.rb\''  + "\n"

    self.script_content = script_content   + 'b= nil'  + "\n"

  		test_case.test_case_flows.each do |test_flow|


        self.script_content = script_content + 'b = do_' + test_flow.flow_type.code + 
        ' b,' + (test_flow.flow_location=='' ? '' : test_flow.flow_location  + ',')  + 
        '\''  +  test_flow.flow_date + '\''  + "\r\n"

  			self.save
  		end
  end


  def file_script(test_case)

  		test_case.test_scripts.each do |test_script|
  			scriptFile = File.new("./test_script/" + test_case.id.to_s + "_" + test_script.id.to_s +  ".rb" ,"w")
  			scriptFile.write test_script.script_content 
   			scriptFile.close
  		end
  end

  def excuse

  	load "./test_script/" + self.test_case_id.to_s + "_" + self.id.to_s + ".rb"
  end

end
