class TestScript < ActiveRecord::Base
  attr_accessible :script_content, :test_case_id, :test_plan_id,:user_id

  belongs_to :test_plan 
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
        puts 'create one case'
        test_temp = TestScript.new 
        test_temp.test_case_id = test_case.id
        test_temp.test_plan_id = test_plan.id
        test_temp.script_content =  '#encoding: utf-8'  + "\n"
        test_temp.script_content = test_temp.script_content   + 'require \'watir-webdriver\' '  + "\n"

        test_temp.script_content = test_temp.script_content   + '$LOAD_PATH.unshift(File.dirname(__FILE__))'  + "\n"
        test_temp.script_content = test_temp.script_content   + 'require  \'./test_script/base.rb\''  + "\n"

        test_temp.script_content = test_temp.script_content   + 'b= nil'  + "\n"



        setTestFlow(test_case,test_temp,test_plan,0)

      end 

      test_plan.save

  end



  def setTestFlow(test_case,testScript,test_plan,index)

    test_case_flows = test_case.test_case_flows

    if index <= test_case_flows.length - 1
    for i in index..(test_case_flows.length - 1)

        test_plan_datas = TestPlanData.where("test_case_flow_id = ? and test_plan_id = ?",test_case_flows[i].id,test_plan.id).first
        test_datas= []

        if test_plan_datas !=nil


          #是枚举数
              if test_plan_datas.flow_date_type != nil and (test_plan_datas.flow_date_type.code=='region' or  test_plan_datas.flow_date_type.code=='enum')
              reg = Regexp.new(".*\#(.*)\#.*")
              res =  reg.match(test_plan_datas.test_data)

              if res != nil and res.length ==2 and test_case_flows[i].flow_type.code != 'checkCode'
             
                if res[1].split("\|").length > 1
                  test_datas= []
                  res[1].split("\|").each do |b|
                    temp = test_plan_datas.test_data
                    temp = temp.sub(/\#.*\#/, b)
                    test_datas.push temp
                  end
                else

                  ranges = res[1].split("\-")
                  if ranges.length > 1

                    for m in (ranges[0].to_i)..(ranges[1].to_i)
                      temp = test_plan_datas.test_data
                      temp = temp.sub(/\#.*\#/, m.to_s)
                      p "prams : " + temp 
                      test_datas.push temp
                    end
                  end

                end
              end

            else
              #普通数
                 test_datas = [test_plan_datas.test_data]
            end

        else
          test_datas= ['']
        end

        p '--------------------------------------------------------'
        p test_datas


        #截图特殊处理
       if test_case_flows[i].flow_type.code == 'pic'
        test_case_flows[i].flow_location = "{:test_script_id=>0,:test_plan_id=>#{test_plan.id},:test_case_id=>#{test_case.id},:test_result_flag => true}"
       end


        script_content_old = testScript.script_content

        next_flow = i+1

        for j in 0..test_datas.length-1

            testScript.script_content = script_content_old

            if test_case_flows[i].flow_type.code == 'checkCode'
              data = {:reg=>test_datas[j],:host=>test_plan.host,:user=>test_plan.user_name,:password=>test_plan.pd,:log_path=>test_plan.log_path}
            testScript.script_content = script_content_old  + 'b = do_' + test_case_flows[i].flow_type.code + 
        ' b,' + (test_case_flows[i].flow_location=='' ? '' : test_case_flows[i].flow_location  + ',')  + 
           data.to_s  + "\r\n"
            else
               testScript.script_content = script_content_old  + 'b = do_' + test_case_flows[i].flow_type.code + 
        ' b,' + (test_case_flows[i].flow_location=='' ? '' : test_case_flows[i].flow_location  + ',')  + 
        '\''  +  test_datas[j] + '\''  + "\r\n"
            end
            if j !=test_datas.length-1
               testScriptClone = testScript.clone
               setTestFlow(test_case,testScriptClone,test_plan,next_flow)
            end

        end

    end
   end
    testScript.script_content = testScript.script_content   + 'b.quit'  + "\n"
    testScript.id = nil
    testScript.user_id = test_plan.user_id
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

        if test_flow.flow_type.code == 'pic'
        test_flow.flow_type.code = 'pic_test'
       end


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
