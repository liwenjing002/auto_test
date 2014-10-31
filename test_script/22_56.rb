#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  'base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'www.baidu.com'
