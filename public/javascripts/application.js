$(document).ready(function () {

	function popupCenter(url, width, height, name) {
	  var left = (screen.width/2)-(width/2);
	  var top = (screen.height/2)-(height/2);
	  //return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
	  //this is for the url to work in canvas
	  return window.top.location.replace(url);
	}
	
	function popupCenterShare(url, width, height, name) {
	  var left = (screen.width/2)-(width/2);
	  var top = (screen.height/2)-(height/2);
	  return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
	}

	$("a.popup").click(function(e) {
	  popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
	  e.stopPropagation(); return false;
	});
	
	$("a.popupShare").click(function(e) {
	  popupCenterShare($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
	  e.stopPropagation(); return false;
	});
	
	// if(window.opener) {
	//     window.opener.location.reload(true);
	//     window.close()
	//   }

});