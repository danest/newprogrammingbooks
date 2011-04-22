$(document).ready(function () {

	function popupCenter(url, width, height, name) {
	  var left = (screen.width/2)-(width/2);
	  var top = (screen.height/2)-(height/2);
	  return window.open(url);
	}

	$("a.popup").click(function(e) {
	  popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
	  e.stopPropagation(); return false;
	});
	
	// if(window.opener) {
	//     window.opener.location.reload(true);
	//     window.close()
	//   }

});