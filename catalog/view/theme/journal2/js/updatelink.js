$(document).ready(function () {
  var auth_email = localStorage.auth_email;

  var linkwebsiteX = localStorage.linkwebsite;
  var linkwebsiteY = linkwebsiteX.replace("&product_id", "#product_id");
  var linkwebsite = linkwebsiteY.replace("&path", "#path");

  // window.alert(linkwebsite);

  var urls =
    "https://gudangmaterials.id/api4/android/index.php/updatelink/profile2/?callback=?";
  var dataString = "linkwebsite=" + linkwebsite + "&auth_email=" + auth_email;

  $.ajax({
    type: "POST",
    url: urls,
    data: dataString,
    crossDomain: true,
    cache: false,
    success: function (data) {
      if (data["status"] == "OK") {
        //window.alert(data['linkwebsiteX']);
      }
    },
  });
});
