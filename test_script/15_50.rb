#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  'base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'www.google.com'
b = do_input b,{:id=>"lst-ib",:type=>"input",:class=>"gsfi lst-d-f",:name=>"q"},'测试自动化脚本'
b = do_click b,{:id=>"lst-ib",:type=>"input",:class=>"gsfi lst-d-f",:name=>"q"},''
