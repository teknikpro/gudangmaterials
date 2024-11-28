$(document).ready(function () {
  var lock = localStorage.lock;
  if (lock != "undefined") {
  } else {
    localStorage.lock = "0";
  }

  if ((localStorage.lock = "0")) {
    var urls =
      "https://gudangmaterials.id/api4/android/index.php/getdeviceid/profile2/?callback=?";
    var auth_email = "";
    //window.alert("Okeh");
    var dataString = "auth_email=" + auth_email;
    $.ajax({
      type: "POST",
      url: urls,
      data: dataString,
      crossDomain: true,
      cache: false,
      success: function (data) {
        if (data["status"] == "OK") {
			

			
			
          localStorage.deviceid = data["deviceid"];
          //alert(localStorage.deviceid);
		  
	
		  
          localStorage.lock = "1";
          //window.alert(data['deviceid']);

          var urls =
            "https://gudangmaterials.id/api4/android/index.php/deldeviceid/profile2/?callback=?";
          var auth_email = "";
          //window.alert("Okeh");
          var dataString = "deviceidX=" + localStorage.deviceid;
          $.ajax({
            type: "POST",
            url: urls,
            data: dataString,
            crossDomain: true,
            cache: false,
            success: function (data) {
              if (data["status"] == "OK") {
                //alert(localStorage.deviceid);
              }
            },
          });
        }
      },
    });
  }

  //alert(localStorage.deviceid);
});
