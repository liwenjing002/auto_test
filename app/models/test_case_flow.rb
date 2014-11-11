class TestCaseFlow < ActiveRecord::Base
  attr_accessible :flow_date, :flow_date_type_id, :flow_location, :flow_seq, :flow_type_id, :test_case_id
  belongs_to :flow_date_type
  belongs_to :flow_type


  def get_test_data_by_plan test_plan_id

  	testdata = TestPlanData.where("test_case_flow_id = ? and test_plan_id = ? ",self.id,test_plan_id)
  if testdata.length > 0 
  	return testdata[0]
 	 else
  	return nil
  end

  end

end
