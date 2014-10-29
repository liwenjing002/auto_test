class TestScript < ActiveRecord::Base
  attr_accessible :script_content, :test_case_id, :test_plan_id


  before_destroy :rm_file


  def rm_file
  	if File::exists?(self.test_case_id.to_s + "_" + self.id.to_s +  ".rb")
  		File.delete(self.test_case_id.to_s + "_" + self.id.to_s +  ".rb")
  	end

  end


  def db_script(test_case)

  		test_case.test_scripts.each do |test_script|
  			test_script.destroy
  		end

		self.script_content = 'require \'watir-webdriver\' '  + "\r\n"
  		test_case.test_case_flows.each do |test_flow|

  			if test_flow.flow_type.code=='brower'
  				self.script_content = script_content + 'b = Watir::Browser.new :' + test_flow.flow_date + "\r\n"
  			end

  			if test_flow.flow_type.code=='url'
  				self.script_content = script_content + 'b.goto \'' + test_flow.flow_date + '\''  + "\r\n"
  			end
  			self.save
  		end
  end


  def file_script(test_case)

  		test_case.test_scripts.each do |test_script|
  			scriptFile = File.new(test_case.id.to_s + "_" + test_script.id.to_s +  ".rb" ,"w")
  			scriptFile.write test_script.script_content 
   			scriptFile.close
  		end
  end

  def excuse
  	load self.test_case_id.to_s + "_" + self.id.to_s + ".rb"
  end

end
