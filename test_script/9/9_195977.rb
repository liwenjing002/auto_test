#encoding: utf-8
require 'watir-webdriver' 
$LOAD_PATH.unshift(File.dirname(__FILE__))
require  './test_script/base.rb'
b= nil
b = do_brower b,'ie'
b = do_url b,'www.baidu.com'
b = do_input b,{:id=>"kw",:type=>"input",:class=>"s_ipt nobg_s_fm_focus nobg_s_fm_hover",:name=>"wd",},'第一p2p'
b = do_click b,{:id=>"su",:type=>"input",:class=>"btn self-btn bg s_btn btn_h s_btn_h",},''
b = do_click b,{:type=>"em",:text=>"第一p2p",},''
b = do_click b,{:type=>"a",:text=>"登录",},''
b = do_input b,{:id=>"user",:type=>"input",:class=>"ps_text",:name=>"username",},'13757162413'
b = do_input b,{:id=>"input-password",:type=>"input",:class=>"ps_text",:name=>"password",},'1988abc'
b = do_click b,{:type=>"a",:text=>"李文静",},''
b = do_click b,{:type=>"a",:class=>"button_cz",:text=>"充值",},''
b = do_input b,{:id=>"charge",:type=>"input",:class=>"user_name validate[required,funcCall[X.V.checkCrash]]",:name=>"money",},'1'
b = do_click b,{:type=>"a",:class=>"pay_button",:text=>"前往先锋在线支付",},''
b = do_click b,{:id=>"quickPayTab",:type=>"a",:class=>"payf_type_tab",:text=>"一键支付",},''
b.quit
