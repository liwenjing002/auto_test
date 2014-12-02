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
b = do_click b,{:type=>"a",:class=>"view_01",:text=>"投资",},''
b = do_input b,{:id=>"invest_input",:type=>"input",:class=>"text_box",:name=>"money",},'10'
b = do_click b,{:type=>"button",:class=>"button_touzi ",:text=>"投资",},''
b = do_click b,{:type=>"a",:class=>"button_subtongyi1",:name=>"btn_agree",:data=>"1"},''
b = do_click b,{:type=>"a",:class=>"button_subtongyi1",:name=>"btn_agree",:data=>"2"},''
b = do_click b,{:type=>"a",:class=>"button_subtongyi1",:name=>"btn_agree",:data=>"3"},''
b = do_click b,{:type=>"a",:class=>"button_subtongyi1",:name=>"btn_agree",:data=>"4"},''
b = do_click b,{:id=>"J_bid_submit",:type=>"input",:class=>"button_confirm1",},''
b = do_assert b,{:id=>"test_case_flow_flow_location_18",:type=>"input",:name=>"test_case_flow[flow_location]",},'您可以在我的P2P里查看投资记录。'
b = do_click b,{:type=>"input",:class=>"dialog-ok",},''
b.quit
