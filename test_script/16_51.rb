#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  'base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'www.baidu.com'
b = do_input b,{:id=>"kw",:type=>"input",:class=>"s_ipt nobg_s_fm_focus nobg_s_fm_hover",:name=>"wd",},'ruby'
b = do_click b,{:id=>"su",:type=>"input",:class=>"btn self-btn bg s_btn btn_h s_btn_h",},''
b = do_click b,{:type=>"a",:textContent:"Ruby_百度百科",},''
