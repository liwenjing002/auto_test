#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
load  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'

b = do_url b,'https://www.ucfpay.com/'

b = do_input b,{:id=>"username",:type=>"input",:class=>"input-block-level n-invalid",:name=>"username",},'13757162413'

b = do_input b,{:id=>"userpasswdNP",:type=>"embed",},'1988abc'


b = do_checkCode b,{:id=>"checkCode",:type=>"input"},{:reg=>'idcode:(.{4})',:host=>'106.187.37.16',:user=>"root",:password=>'lwj1988@A',:log_path=>"/home/lee/logs/test.log"}

#b.quit
