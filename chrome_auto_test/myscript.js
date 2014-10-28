$(document).mousedown(function(e){ 
if(e.which ==3){
	
		$.confirm({
			'title'		: '页面元素选择',
			'message'	: '选择定位元素或者获取元素上的数值',
			'buttons'	: {
				'定位元素'	: {
					'class'	: 'blue',
					'action': function(){
						var msg = {
						msg_type: "get_elm",
						id: $(e.target).attr("id"),
						type: e.target.localName,
						class: $(e.target).attr("class"),
						name: $(e.target).attr("name"),
						value:$(e.target).attr("value"),
						textContent : e.target.textContent,
						url: document.URL
					};



				chrome.extension.sendRequest(msg, function(response) {
			        if(response.id!=null &&response.id!=''){
			        	$("#"+response.id).attr("value",response.date)
			        }
				});
					}
				},
				'获取数值'	: {
					'class'	: 'gray',
					'action': function(){

						var msg = {
						msg_type: "elm_value",
						id: $(e.target).attr("id"),
						type: e.target.localName,
						class: $(e.target).attr("class"),
						name: $(e.target).attr("name"),
						value:$(e.target).attr("value"),
						textContent : e.target.textContent,
						url: document.URL
					};



				chrome.extension.sendRequest(msg, function(response) {
			        if(response.id!=null &&response.id!=''){
			        	$("#"+response.id).attr("value",response.date)
			        }
				});


					}	// Nothing to do in this case. You can as well omit the action property.
				}
			}
		});



	

   

}

})



