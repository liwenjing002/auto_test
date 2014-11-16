#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'

b = do_url b,'https://auth.alipay.com/login/index.htm'

b = do_input b,{:id=>"J-input-user",:type=>"input",:class=>"ui-input ui-input-normal",:name=>"logonId",},'690294000@qq.com'

b = do_input b,{:id=>"edit_password",:type=>"object",:name=>"edit_password",},'lwj1988@A'

#b.quit
