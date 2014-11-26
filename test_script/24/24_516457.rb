#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'file:///C:/Users/lenovo/Desktop/P2P接口测试页面更新v1.23344/账户充值.html'
b = do_input b,{:id=>"amount",:type=>"input",:name=>"amount",},'1'
b = do_click b,{:id=>"submit",:type=>"input",},''
b = do_click b,{:type=>"radio",:value=>"PAB_1111010_01",:class=>"jdradio",:name=>"bankRadio",},''
b = do_click b,{:id=>"bankPayNext",:type=>"input",:class=>"but-yellow but-gray",},''
b = do_click b,{:type=>"input",:class=>"but-yellow but-gray load_ebank_charge",},''
b = do_input b,{:id=>"cardNumber",:type=>"input",:class=>"ipt_txt CardDefault txtclick",:name=>"cardNumber",},'6222023602899998371'
b = do_click b,{:id=>"btnNext",:type=>"input",:class=>"btn_blue",},''
b = do_input b,{:id=>"_ocx_password",:type=>"embed",:class=>"ocx_atm ",},'888888'
b = do_input b,{:id=>"smsCode",:type=>"input",:class=>"txt CardDefault txtclick",:name=>"smsCode",},'111111'
b = do_click b,{:id=>"btnCardPay",:type=>"input",:class=>"btn_blue139p CardDefault",:name=>"btnCardPay",},''
b = do_sleep b,'60'
b = do_click b,{:id=>"btnBack",:type=>"input",:class=>"btn_blue139p",:name=>"btnBack",},'恭喜您,充值成功'
b = do_assert b,{:type=>"span",:class=>"font24 color-gray1",:text=>"恭喜您,充值成功",},'恭喜您,充值成功'
b.quit
