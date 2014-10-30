
#元素定位
def get_element(b,data,type)
  
  t= nil
  
  if(type=="input")
    t = b.text_field(data)
  end
  if(type=="a")
    t = b.link(data)
  end
  
  if(type=="button")
    t = b.button(data)
  end
  
  if t.exists?
    puts t 
    return t 
  else
    class_list = data[:class]
    if class_list !=nil and class_list !=''
    class_list.split(" ").each do |class_type|
      data[:class] = class_type
      
      if(type=="input")
        t = b.text_field(data)
      end
      if(type=="a")
        t = b.link(data)
      end
      
      if(type=="button")
        t = b.button(data)
      end
      
      if t.exists?
        puts t 
        return t
      end
    end
    end
    
    
    data.delete(:class)
    
    if(type=="input")
      t = b.text_field(data)
    end
    if(type=="a")
      t = b.link(data)
    end
    
    if(type=="button")
      t = b.button(data)
    end
    
    if t.exists?
      return t
    end
    
    data.delete(:name)
    
    if t.exists?
      return t
    end
  end
end


#处理url
def do_url(b,url)
  b.goto url
  return b
end



#处理输入
def do_input(b,json,data)
  
  if (json[:type] !=nil and json[:type]=="input") 
    type = json[:type]
    json.delete(:type)
    t = get_element(b,json,type)
    t.exists?
    t.set data
  end
  
  return b
end

#处理浏览器
def do_brower(b,brower)
  if brower =='chrome'
    b = Watir::Browser.new :chrome
    return b 
  end
end



#处理点击
def do_click(b,json,data)
  type = json[:type]
  json.delete(:type)
  if type== 'a'
    t = get_element(b,json,'a')
  else
    t = get_element(b,json,'button')
  end
  t.exists?
  t.click
  return b
end