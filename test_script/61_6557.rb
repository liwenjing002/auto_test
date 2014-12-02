#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'www.baidu.com'
b = do_input b,{:id=>"kw",:type=>"input",:class=>"s_ipt",:name=>"wd",},'selenium'
b = do_click b,{:id=>"su",:type=>"input",:class=>"bg s_btn s_btn_h",},''
b.quit
