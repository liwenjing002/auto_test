class TestCase < ActiveRecord::Base
  attr_accessible :desc, :title, :user_id,:host,:user_name,:pd
  attr_accessor :selected
  has_many :test_case_flows, :dependent => :destroy,:order=>"flow_seq asc",:conditions => "flow_type_id is not null " 
  has_many :test_scripts
end
