#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'www.firstp2p.com'
b = do_click b,{:type=>"a",:text=>"登录",},''
b = do_input b,{:id=>"user",:type=>"input",:class=>"ps_text",:name=>"username",},'13757162413'
b = do_input b,{:id=>"input-password",:type=>"input",:class=>"ps_text",:name=>"password",},'1988abc'
b = do_click b,{:type=>"input",:class=>" enter_btn",},''
b.quit
