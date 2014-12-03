#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'http://test.p2pyun.cn/'
b = do_click b,{:type=>"a",:text=>"登录",},''
b = do_input b,{:id=>"user",:type=>"input",:class=>"ps_text",:name=>"username",},'ritayu005'
b = do_input b,{:id=>"test_case_flow_flow_location_13",:type=>"input",:name=>"test_case_flow[flow_location]",},'123456'
b = do_click b,{:id=>"test_case_flow_flow_location_14",:type=>"input",:name=>"test_case_flow[flow_location]",},''
b = do_click b,{:type=>"a",:class=>"button_cz",:text=>"充值",},''
b = do_input b,{:id=>"test_case_flow_flow_location_17",:type=>"input",:name=>"test_case_flow[flow_location]",},'100'
b = do_click b,{:id=>"incharge_done",:type=>"button",:class=>"user_button mt10 mb20",:text=>"充值",},''
b = do_click b,{:type=>"a",:class=>"pay_button",:text=>"前往先锋在线支付",},''
b = do_click b,{:type=>"radio",:value=>"HXB_1111010_01",:class=>"jdradio",:name=>"bankRadio",},''
b = do_click b,{:id=>"bankPayNext",:type=>"input",:class=>"but-yellow but-gray",},''
b = do_click b,{:type=>"input",:class=>"but-yellow but-gray load_ebank_charge",},''
b = do_input b,http://demo.p2pyun.ucfpay.com/,'6222988812340000'
b = do_click b,{:id=>"test_case_flow_flow_location_24",:type=>"input",:name=>"test_case_flow[flow_location]",},''
b = do_input b,{:id=>"test_case_flow_flow_location_25",:type=>"input",:name=>"test_case_flow[flow_location]",},'123456'
b = do_input b,{:id=>"smsCode",:type=>"input",:class=>"txt CardDefault",:name=>"smsCode",},'123456'
b = do_click b,{:id=>"btnCardPay",:type=>"input",:class=>"btn_blue139p CardDefault",:name=>"btnCardPay",},''
b = do_sleep b,'1000'
b = do_click b,{:id=>"btnBack",:type=>"input",:class=>"btn_blue139p",:name=>"btnBack",},''
b = do_click b,{:type=>"a",:class=>"but-gray but-yellow w100 mr20",:text=>"完成",},''
b = do_click b,{:type=>"input",:class=>"paybutton",},''
b.quit
