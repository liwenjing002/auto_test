#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_click b,{:type=>"a",:text=>"登录",},''
b = do_sleep b,'5'
b.quit
