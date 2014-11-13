#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'ie'
b = do_url b,'www.firstp2p.com'
b = do_click b,{:type=>"a",:text=>"登录",},''
b.quit
