class TestCaseFlow < ActiveRecord::Base
  attr_accessible :flow_date, :flow_date_type_id, :flow_location, :flow_seq, :flow_type_id, :test_case_id
  belongs_to :flow_date_type
  belongs_to :flow_type
end
