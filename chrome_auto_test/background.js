// Copyright (c) 2010 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// A generic onclick callback function.
function genericOnClick(info, tab) {
  chrome.tabs.onUpdated.addListener(checkForValidUrl);
}

// Create one test item for each context type.


// Create a parent item and two children.
var parent1 = chrome.contextMenus.create({"title": "开始定位元素","onclick": genericOnClick});


var elm ='';

var elm_date ="";





chrome.extension.onRequest.addListener(
  function(request, sender, sendResponse) {
    
    if(request.msg_type=="get_elm"){
   //放数据
   if(elm=='')   {
      if(request.id!=null && request.id!=''){
        elm = elm + "id:" + request.id + '|'
      }
      if(request.type!=null && request.type!=''){
        elm = elm + "type:" + request.type + '|'
      }
      if(request.class!=null && request.class!=''){
        elm = elm + "class:" + request.class + '|'
      }
      if(request.name!=null && request.name!=''){
        elm = elm + "name:" + request.name + '|'
      }
      if(request.textContent!=null && request.textContent!=''){
        elm = elm + "textContent:" + request.textContent + '|'
      }


   }else{

    var msg = {
        id: request.id,
        date:elm,
       msg_type:'set_date'
      };
      elm = '';
       sendResponse(msg);
   }
 
  }



     
  });