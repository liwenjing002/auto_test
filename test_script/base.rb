#encoding: utf-8
#元素定位
def get_element(b,data,type)
  last_window_index = b.windows.length - 1
  
  for i in 0..last_window_index
    
    w = b.window(:index => last_window_index-i).use 
    puts "使用第" + (last_window_index-i).to_s + "个窗口"
    puts "当前窗口url:" + w.url 
    puts "当前窗口标题:"  + w.title
    puts "开始寻找元素:"
    puts data
    t= nil
    
    t = getByType(type, b, data)
    
    if t.exists?
      puts "类型为：" + type + ",全量匹配，找到元素--------退出寻找"
      return t 
    else
      class_list = data[:class]
      if class_list !=nil and class_list !=''
        class_list.split(" ").each do |class_type|
          data[:class] = class_type
          
          t = getByType(type, b, data)
          
          if t.exists?
            puts "类型为：" + type + ",通过class匹配，找到元素--------退出寻找"
            return t
          end
        end
      end
      
      
      data.delete(:class)
      
      t = getByType(type, b, data)
      
      if t.exists?
        puts "类型为：" + type + ",删除class，找到元素--------退出寻找"
        return t
      end
      
      data.delete(:text)
      
      t = getByType(type, b, data)
      
      if t.exists?
        puts "类型为：" + type + ",删除text,找到元素--------退出寻找"
        return t
      end
      
      data.delete(:name)
      
      t = getByType(type, b, data)
      
      if t.exists?
        puts "类型为：" + type + ",删除name,找到元素--------退出寻找"
        return t
      end
      
      data.delete(:id)
      
      t = getByType(type, b, data)
      
      if t.exists?
        puts "类型为：" + type + ",删除id,找到元素--------退出寻找"
        return t
      end
      
    end
  end
  puts "类型为：" + type + ",找不到元素--------退出寻找1"

  msg = '找不到元素,类型: '  + type 
  screenshot_path =  Time.now.strftime("%Y-%m-%d-%H-%M-%S")+".png"
  b.driver.save_screenshot "E:\/code\/auto_test\/public\/screan_shot\/" + screenshot_path

  msg  = msg + "<a href=/screan_shot/" + screenshot_path + " target='_blank'>查看截图</a>"
  b.quit
  raise msg
  return t
end

def getByType type, b, data
  if (type == "input")
    t = b.text_field data
  end
  if (type == "a")
    t = b.link data
  end
  if (type == "button")
    t = b.button data
  end
  
  if (type == "span")
    t = b.span data
   end
   
  if (type == "select")
    t = b.select_list data
	end
	
	if (type == "label")
    t = b.label data
	end
	if (type == "div")
    t = b.div data
	end
	if (type == "ul")
    t = b.ul data
	end
	if (type == "li")
    t = b.li data
	end
 
  
  return t 
end



#处理url
def do_url(b,url)
  b.goto url
  return b
end



#处理输入
def do_input(b,json,data)
  puts 
  puts 
  puts "华丽的分割线-----------------------------------------------------------------------"
  puts "开始处理输入------------------"
  if (json[:type] !=nil and json[:type]=="input") 
    type = json[:type]
    json.delete(:type)
    t = get_element(b,json,type)
    if(t.exists?)
      t.set data
      puts "输入成功------------------"
    else
      puts "找不到元素，输入结束-----------"
      msg = '找不到元素,类型: '  + type 
      screenshot_path =  Time.now.strftime("%Y-%m-%d-%H-%M-%S")+".png"
      b.driver.save_screenshot "E:\/code\/auto_test\/public\/screan_shot\/" + screenshot_path

      msg  = msg + "<a href=/screan_shot/" + screenshot_path + " target='_blank'>查看截图</a>"
      b.quit
      raise msg
    end
  end
  
  puts "华丽的分割线-----------------------------------------------------------------------"
  
  
  return b
end

#处理浏览器
def do_brower(b,brower)
  if brower =='chrome'
    b = Watir::Browser.new :chrome
    return b 
  end
  
  if brower =='ie'
    b = Watir::Browser.new :ie
    return b 
  end
  
  if brower =='firefox'
    b = Watir::Browser.new :firefox
    return b 
  end
  
end



#处理点击
def do_click(b,json,data)
  puts 
  puts 
  puts "华丽的分割线-----------------------------------------------------------------------"
  puts "开始处理点击------------------"
  type = json[:type]
  json.delete(:type)
  if type== 'input'
    puts "inout类型点击判断类型为按钮，处理按钮------------------"
    t = get_element(b,json,'button')
  else
     t = get_element(b,json,type)
  end
  if t.exists?
    t.click
    puts "点击成功------------------"
    return b
  else
    puts "找不到元素，点击结束-----------"

    msg = '找不到元素,类型: '  + type 
    screenshot_path =  Time.now.strftime("%Y-%m-%d-%H-%M-%S")+".png"
    b.driver.save_screenshot "E:\/code\/auto_test\/public\/screan_shot\/" + screenshot_path

    msg  = msg + "<a href=/screan_shot/" + screenshot_path + " target='_blank'>查看截图</a>"
    b.quit
    raise msg
  end
end

