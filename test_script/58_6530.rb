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
b = do_click b,{:type=>"a",:class=>"button_cz",:text=>"充值",},''
b = do_input b,{:id=>"charge",:type=>"input",:class=>"user_name validate[required,funcCall[X.V.checkCrash]]",:name=>"money",},'10'
b = do_click b,{:id=>"incharge_done",:type=>"button",:class=>"user_button mt10 mb20",:text=>"充值",},''
b = do_click b,{:type=>"a",:class=>"pay_button",:text=>"前往先锋在线支付",},''
b = do_click b,{:id=>"bankPayNext",:type=>"input",:class=>"but-yellow but-gray",},''
b = do_click b,{:type=>"input",:class=>"but-yellow but-gray load_ebank_charge",},''
b = do_sleep b,'0'
b = do_sleep b,'0'
b = do_input b,{:id=>"cardNumber",:type=>"input",:class=>"ipt_txt CardDefault gray_12px",:name=>"cardNumber",},'6222988812340000'
b = do_click b,{:id=>"btnNext",:type=>"input",:class=>"btn_blue",},''
b = do_input b,{:id=>"_ocx_password",:type=>"embed",:class=>"ocx_atm ",},'123456'
b = do_input b,{:id=>"smsCode",:type=>"input",:class=>"txt CardDefault",:name=>"smsCode",},'123456'
b = do_click b,{:id=>"btnCardPay",:type=>"input",:class=>"btn_blue139p CardDefault",:name=>"btnCardPay",},''
b = do_sleep b,'10'
b = do_click b,{:id=>"btnBack",:type=>"input",:class=>"btn_blue139p",:name=>"btnBack",},''
b = do_click b,{:type=>"a",:class=>"but-gray but-yellow w100 mr20",:text=>"完成",},''
b = do_click b,{:type=>"input",:class=>"paybutton",},''
b = do_assert b,{:type=>"span",:class=>"font16",:text=>"恭喜，支付成功！                              系统将在3秒后自动跳转，如果没有跳转，请点击 这里 跳转",},'恭喜，支付成功！'
b.quit
