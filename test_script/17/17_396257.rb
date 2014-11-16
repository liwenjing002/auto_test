#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'file:///C:/Users/lenovo/Desktop/P2P接口-p2p/账户充值.html'
b = do_input b,{:id=>"amount",:type=>"input",:name=>"amount",},'300'
b = do_click b,{:id=>"submit",:type=>"input",},''
b = do_click b,{:type=>"radio",:value=>"ZSBC_1311010_01",:class=>"jdradio",:name=>"bankRadio",},''
b = do_click b,{:id=>"bankPayNext",:type=>"input",:class=>"but-yellow but-gray",},''
b = do_click b,{:type=>"input",:class=>"but-yellow but-gray load_ebank_charge",},''
b = do_input b,{:id=>"cardNumber",:type=>"input",:class=>"ipt_txt CardDefault txtclick",:name=>"cardNumber",},'6222023602899998371'
b = do_assert b,{:type=>"em",:class=>"order_money",:text=>"0.22",},'200'
b.quit
