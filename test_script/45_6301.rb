#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
load  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'

b = do_url b,'https://www.ucfpay.com/'

b = do_input b,{:id=>"username",:type=>"input",:class=>"input-block-level n-invalid",:name=>"username",},'13757162413'

b = do_input b,{:id=>"userpasswdNP",:type=>"embed",},'1988abc'


b = do_checkcode b,{:id=>"checkCode",:type=>"input"},'checkcode:(.{4})'

#b.quit
