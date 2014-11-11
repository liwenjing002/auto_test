class TestScript < ActiveRecord::Base
  attr_accessible :script_content, :test_case_id, :test_plan_id


  before_destroy :rm_file


  def rm_file
  	if File::exists?("./test_script/" + self.test_case_id.to_s + "_" + self.id.to_s +  ".rb")
  		File.delete( "./test_script/" + self.test_case_id.to_s + "_" + self.id.to_s +  ".rb")
  	end

  end


  def db_plan_script(test_plan)
      test_plan.test_num = 0

      TestScript.delete_all("test_plan_id = #{test_plan.id}")
  

      test_plan.test_cases.each do |test_case|
        self.id = nil
        self.test_case_id = test_case.id
        self.test_plan_id = test_plan.id
        self.script_content =  '#encoding: utf-8'  + "\n"
        self.script_content = script_content   + 'require \'watir-webdriver\' '  + "\n"

        self.script_content = script_content   + '$LOAD_PATH.unshift(File.dirname(__FILE__))'  + "\n"
        self.script_content = script_content   + 'require  \'./test_script/base.rb\''  + "\n"

        self.script_content = script_content   + 'b= nil'  + "\n"



        setTestFlow(test_case,self,test_plan,0)

      end 

      test_plan.save

  end



  def setTestFlow(test_case,testScript,test_plan,index)

    test_case_flows = test_case.test_case_flows

    for i in index..(test_case_flows.length - 1)

        test_plan_datas = TestPlanData.where("test_case_flow_id = ? and test_plan_id = ?",test_case_flows[i].id,test_plan.id).first

        if test_plan_datas !=nil
          test_datas =test_plan_datas.test_data.split("\|")
        else
          test_datas= ['']
        end




        script_content_old = testScript.script_content

        for j in 0..test_datas.length-1

            testScript.script_content = script_content_old

            testScript.script_content = script_content_old  + 'b = do_' + test_case_flows[i].flow_type.code + 
        ' b,' + (test_case_flows[i].flow_location=='' ? '' : test_case_flows[i].flow_location  + ',')  + 
        '\''  +  test_datas[j] + '\''  + "\r\n"

            if j !=test_datas.length-1
               testScriptClone = testScript.clone
               setTestFlow(test_case,testScriptClone,test_plan,(i+1))
            end

        end

    end
    testScript.script_content = testScript.script_content   + 'b.quit'  + "\n"
    testScript.id = nil
    test_plan.test_num = test_plan.test_num + 1
    testScript.save

  end




  def db_script(test_case)

  		test_case.test_scripts.each do |test_script|
  			test_script.destroy
  		end

    self.script_content =  '#encoding: utf-8'  + "\n"
		self.script_content = script_content   + 'require \'watir-webdriver\' '  + "\n"

    self.script_content = script_content   + '$LOAD_PATH.unshift(File.dirname(__FILE__))'  + "\n"
    self.script_content = script_content   + 'require  \'./test_script/base.rb\''  + "\n"

    self.script_content = script_content   + 'b= nil'  + "\n"

  		test_case.test_case_flows.each do |test_flow|


        self.script_content = self.script_content + 'b = do_' + test_flow.flow_type.code + 
        ' b,' + (test_flow.flow_location=='' ? '' : test_flow.flow_location  + ',')  + 
        '\''  +  test_flow.flow_date + '\''  + "\r\n"

  		end
      self.script_content = script_content   + 'b.quit'  + "\n"
      self.save
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
