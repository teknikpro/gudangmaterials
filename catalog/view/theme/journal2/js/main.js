$(document).ready(function () {						           
					
								var urls ="https://gudangmaterials.id/api4/android/index.php/koneksitoken/profile2/?callback=?";
								//var kode = "123456";
								var auth_email = localStorage.auth_email;
								// alert(localStorage.deviceid);
								var dataString = "auth_email=" + auth_email + "&deviceidX=" + localStorage.deviceid;
								//var dataString = "kode_id=" + kode;
	
	
								//window.alert(localStorage.deviceidX);
								$.ajax({
									  type: "POST",
									  url: urls,
									  data: dataString,
									  crossDomain: true,
									  cache: false,
									  success: function(data)
											{
												if(data['status']=="OK")
												{ 
																

											      if(localStorage.auth_email!=""){
													var token = data['token'];
													var userid = data['userid'];
													var deviceidX = data['deviceidX'];
													//localStorage.deviceid = deviceidX;
													//*var userid = localStorage.useridkey;
													var is_partner = data['is_partner'];
													//*var deviceidX = data['deviceidX'];
													localStorage.token = token;
													localStorage.useridkey = userid;
													localStorage.is_partner = is_partner;
													localStorage.deviceid = data['deviceidX'];
													
													
	
													 if (localStorage.deviceid == "null") {
													   alert("Sebaiknya Hapus dulu data diaplikasi ini supaya notifikasi sistem terakses, petunjuk -> cari info aplikasi, cari penyimpanan, silahkan hapus data" );
													 }
																
													
													//alert(localStorage.deviceid);
													//alert(localStorage.lock);
												   }

												
												}
											
											}
									 
								  });
					
});
