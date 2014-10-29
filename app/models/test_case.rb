class TestCase < ActiveRecord::Base
  attr_accessible :desc, :title, :user_id,:host,:user_name,:pd
  has_many :test_case_flows, :dependent => :destroy,:order=>"flow_seq asc"
  has_many :test_scripts
end
