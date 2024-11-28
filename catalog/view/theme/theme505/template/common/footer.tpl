<footer>
  <div class="container">
	<div class="row">
		<div class="col-sm-2">
			<?php if ($informations) { ?>
			<div class="footer_box">
				<h5><?php echo $text_information; ?></h5>
				<ul class="list-unstyled">
				<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_service; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_extra; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_account; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="footer_box social">
				<h5><?php echo $text_follow; ?></h5>
				<a href="//www.facebook.com/"><i class="fa fa-facebook"></i></a>
				<a href="//www.twitter.com/"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-rss"></i></a>
			</div>
		</div>
	</div>
	
  </div>
	<div class="copyright">
		<div class="container">
			<?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
		</div> 
	</div>
</footer>
<script src="catalog/view/theme/theme505/js/livesearch.js" type="text/javascript"></script>

</div>

		
		<script>
	window.onload = function() {  
	
	var mapelement=document.getElementById('map');
	
	if(mapelement){
	
	function initialize() {	

	var locations = [
		  ['Tyres', 42.332, -83.046, 2],
		  ['Tyres', 42.649224, -73.796384, 1]
	];
	var styles = [
    {
        "featureType": "landscape",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 65
            },
            {
                "visibility": "on"
            }
        ]
		},
		{
			"featureType": "poi",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"lightness": 51
				},
				{
					"visibility": "simplified"
				}
			]
		},
		{
			"featureType": "road.highway",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"visibility": "simplified"
				}
			]
		},
		{
			"featureType": "road.arterial",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"lightness": 30
				},
				{
					"visibility": "on"
				}
			]
		},
		{
			"featureType": "road.local",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"lightness": 40
				},
				{
					"visibility": "on"
				}
			]
		},
		{
			"featureType": "transit",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"visibility": "simplified"
				}
			]
		},
		{
			"featureType": "administrative.province",
			"stylers": [
				{
					"visibility": "off"
				}
			]
		},
		{
			"featureType": "water",
			"elementType": "labels",
			"stylers": [
				{
					"visibility": "on"
				},
				{
					"lightness": -25
				},
				{
					"saturation": -100
				}
			]
		},
		{
			"featureType": "water",
			"elementType": "geometry",
			"stylers": [
				{
					"hue": "#ffff00"
				},
				{
					"lightness": -25
				},
				{
					"saturation": -97
				}
			]
		}
	];

	var styledMap = new google.maps.StyledMapType(styles,{name: "Styled Map"});
	var map;
	var marker, i;
		
	var mapOptions = {
		zoom: 10,
		scrollwheel: false,
		center: new google.maps.LatLng(42.649224, -73.796384),
		mapTypeControl: false,
		panControl: true,
		scaleControl: false,
		streetViewControl: true,
		mapTypeControlOptions: {
		  mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
		}
	};		
	google.maps.event.addDomListener(window, "resize", function() {
		var center = map.getCenter();
		google.maps.event.trigger(map, "resize");
		map.setCenter(center);
	});
	
	map = new google.maps.Map(document.getElementById('map'),mapOptions);
		map.mapTypes.set('map_style', styledMap);
		map.setMapTypeId('map_style');
		var markerImage = 'image/catalog/gmap_marker.png';
		
		infowindow = new google.maps.InfoWindow(),
        markers = [];
		
		for (i = 0; i < locations.length; i++) {
		
		markers[i] = new google.maps.Marker({
			   map: map,
			   icon: markerImage,
			   position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			   animation: null
		  });		
		var contentString = 'Company Inc., 8901 Marmora Road, Glasgow, D04 89GR';
		var infowindow = new google.maps.InfoWindow({
			content: contentString
		});
		google.maps.event.addListener(markers[i], "click", function() {
            infowindow.open(map, this);
		});
		  
		}		
		
		
		
	}	  
	
		
	initialize();
	} };
</script>

</body></html>