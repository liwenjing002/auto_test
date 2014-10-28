$(document).mousedown(function(e){ 
if(e.which ==3){
	var msg = {
		msg_type: "get_elm",
		id: $(e.target).attr("id"),
		type: e.target.localName,
		class: $(e.target).attr("class"),
		name: $(e.target).attr("name"),
		textContent : e.target.textContent,
		url: document.URL
	};
	

	chrome.extension.sendRequest(msg, function(response) {
        if(response.id!=null &&response.id!=''){
        	$("#"+response.id).attr("value",response.date)
        }
	});

   

}

})



