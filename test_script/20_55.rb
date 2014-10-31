#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  'base.rb'
b= nil
b = do_brower b,'chrome'

b = do_brower b,'chrome'

b = do_url b,'file:///C:/Users/lenovo/Desktop/P2P接口-p2p/账户充值.html'


b = do_input b,{:id=>"amount",:type=>"input",:name=>"amount",},'100'

b = do_click b,{:id=>"submit",:type=>"input",},''

b = do_click b,{:id=>"quickPayTab",:type=>"a",:class=>"payf_type_tab",:text=>"一键支付",},''

