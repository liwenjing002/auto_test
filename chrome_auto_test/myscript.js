$(document).mousedown(function(e){ 
if(e.which ==3){
		
		var conditionText = $(e.target).attr("type");

		if($(e.target).attr("id")){
			conditionText = conditionText + "[id=\'"+ $(e.target).attr("id") +"\']"
		}
		if($(e.target).attr("class")){
			conditionText = conditionText + "[class=\'" + $(e.target).attr("class") + "\']"
		}
		if($(e.target).attr("name")){
			conditionText = conditionText + "[name=\'" + $(e.target).attr("name")+"\']"
		}
		if(e.target.textContent !=""){
			conditionText = conditionText + "[text=\'" + e.target.textContent+"\']"
		}

		var msg ;

		a = $(conditionText)
		if (a.length >1) {
		var num = 0
		a.each(function(){
		    if($(this)[0] === $(e.target)[0]){
		     msg = {
						msg_type: "get_elm",
						id: $(e.target).attr("id"),
						type: e.target.localName,
						elm_type: $(e.target).attr("type"),
						class: $(e.target).attr("class"),
						name: $(e.target).attr("name"),
						value:$(e.target).attr("value"),
						textContent : e.target.textContent,
						url: document.URL,
						index:num
					};

		    }
		    num = num + 1;
		  });

		}else{
						msg = {
						msg_type: "get_elm",
						id: $(e.target).attr("id"),
						type: e.target.localName,
						elm_type: $(e.target).attr("type"),
						class: $(e.target).attr("class"),
						name: $(e.target).attr("name"),
						value:$(e.target).attr("value"),
						textContent : e.target.textContent,
						url: document.URL
					};
				}



				chrome.extension.sendRequest(msg, function(response) {
			        if(response.id!=null &&response.id!=''){
			        	$("#"+response.id).attr("value",response.date)
			        }
				});

   

}

})



