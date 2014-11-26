#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'http://10.20.5.221:8083/member/'
b = do_click b,{:type=>"a",:text=>"注册",},''
b = do_input b,{:id=>"userNo",:type=>"input",:class=>"w220",:name=>"userNo",},'18657139301'
b = do_click b,{:id=>"validPhoneCode",:type=>"input",:name=>"validPhoneCode",},''
b = do_checkCode b,{:id=>"vfyCode",:type=>"input",:class=>"w105",:name=>"vfyCode",},'vfyCode:\[(.{6})\]'
b = do_checkCode b,{:id=>"checkCode",:type=>"input",:class=>"w105",:name=>"checkCode",},'idcode:(.{4})'
b = do_click b,{:type=>"a",:class=>"btn mt20 mgl113",:text=>"下一步",},''
b = do_input b,{:id=>"realName",:type=>"input",:name=>"realName",},'李文静'
b = do_input b,{:id=>"lgnPwd",:type=>"input",:class=>"n-invalid",:name=>"lgnPwd",},'123456'
b = do_input b,{:id=>"repeatlgnPwd",:type=>"input",:name=>"repeatlgnPwd",},'123456'
b = do_input b,{:id=>"paymentPassword",:type=>"input",:name=>"paymentPassword",},'654321'
b = do_input b,{:id=>"repeatpaymentPassword",:type=>"input",:class=>"n-invalid",:name=>"repeatpaymentPassword",},'123abc'
b = do_input b,{:id=>"certNo",:type=>"input",:name=>"certNo",},'330322198902042435'
b = do_select b,{:type=>"select",:class=>"h_open_sel n-invalid",:name=>"quesInfo",},'1.我的宠物是'
b = do_input b,{:id=>"quesRes",:type=>"input",:class=>"idbox w228 n-valid",:name=>"quesRes",},'123'
b = do_click b,{:type=>"a",:class=>"btn mt20 mgl113",:text=>"下一步",},''
b = do_assert b,{:type=>"span" ,:class=>"big-font",:text=>"哇哦，成功啦！"},'哇哦，成功啦！'
b.quit
