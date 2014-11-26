require 'net/http'
require 'net/https'
require 'net/ssh'
 data = {:reg=>"idcode:(.{4})", :host=>"10.20.5.221", :user=>"root", :password=>"4rfv3edc5tgb", :log_path=>"/home/test/logs/member/member-biz.log"}
 ssh = Net::SSH.start(data[:host], data[:user], :password => data[:password]) do |ssh|
    puts  "tail -100 "+  data[:log_path] + "| grep #{data[:reg].split(':')[0]}"
    checkCode = ssh.exec!("tail -100 "+  data[:log_path] + "| grep #{data[:reg].split(':')[0]}")
    puts  checkCode ? checkCode : ""
  
    reg = Regexp.new(data[:reg]) 
    listcode = checkCode.scan(reg)

    last_index = listcode.length - 1

    puts listcode[last_index]

  end