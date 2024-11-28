$(document).ready(function () {
  var urls =
    "https://gudangmaterials.id/api4/android/index.php/userbrand/profile2/?callback=?";
  var id_brand = localStorage.id_brand;
  var dataString = "id_brand=" + id_brand;

  $.ajax({
    type: "POST",
    url: urls,
    data: dataString,
    crossDomain: true,
    cache: false,
    success: function (data) {
      if (data["status"] == "OK") {
        localStorage.nama_brand = data["nama_brand"];
      }
    },
  });
});
