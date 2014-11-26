module ApplicationHelper

def coderay(text)     

  text = "<code lang=\"ruby\">" + text + "</code>"	

  text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do    
    CodeRay.scan($3, $2).div(:css => :class)     
  end    
end

end
