// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//



//require bootstrap.min


$('document').ready(function(){

  var map = new google.maps.Map($('.conf-map')[0], {
    zoom: 15,
    center: { lat: -37.817954, lng: 144.959257}
  });


  console.log(map);

  var marker = new google.maps.Marker({
    position: {lat: -37.817954, lng: 144.959257},
    map: map,
    title: "WDI4 Conf"
  })
});
