#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'http://test.p2pyun.cn/'
b = do_click b,{:type=>"a",:text=>"登录",},''
b = do_input b,{:id=>"user",:type=>"input",:class=>"ps_text",:name=>"username",},'ritayu005'
b = do_input b,{:id=>"input-password",:type=>"input",:class=>"ps_text",:name=>"password",},'123456'
b = do_click b,{:type=>"input",:class=>" enter_btn",},''
b = do_click b,{:type=>"span",:text=>"我的p2p",},''
b = do_click b,{:type=>"a",:class=>"button_tx",:text=>"提现",},''
b = do_input b,{:id=>"Jcarry_amount",:type=>"input",:class=>"user_name",:name=>"amount",},'1'
b = do_click b,{:type=>"input",:class=>"user_button mt20 mb20",},''
b = do_sleep b,'3'
b = do_url b,{:id=>"test_case_flow_flow_location_15",:type=>"input",:name=>"test_case_flow[flow_location]",},'操作成功'
b.quit
