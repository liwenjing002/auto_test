#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'chrome'
b = do_url b,'http://10.20.5.221:8083/member/'
b = do_input b,{:id=>"username",:type=>"input",:class=>"input-block-level ",:name=>"username",},'13757162413'
b = do_input b,{:id=>"userpasswdNP",:type=>"embed",},'123abc'
b = do_checkCode b,{:id=>"checkCode",:type=>"input",:class=>"input-block-level wx add-mgt10",:name=>"checkCode",},{:reg=>"idcode:(.{4})", :host=>"10.20.5.221", :user=>"root", :password=>"4rfv3edc5tgb", :log_path=>"/home/test/logs/member/member-biz.log"}
b = do_click b,{:type=>"button",:class=>"btn btn-large btn-primary sign-in-btn",:text=>"登 录",},''
b = do_assert b,{:type=>"span",:class=>"name",:text=>"您好，康钱磊",},'您好，111'
b.quit
