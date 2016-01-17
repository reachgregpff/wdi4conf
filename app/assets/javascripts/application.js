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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//require bootstrap.min
//= require_tree .

$('document').ready(function(){

    $('a').click(function(){
    $('html, body').animate({
        scrollTop: $( $(this).attr('href') ).offset().top -50
    // scrollBy(0, -50)
    }, 500);
    return false;
});

  // Get the infobox for the map
  var data = "WDI4 Famous 5</br> 45 William Street,</br> Melbourne, VIC 3000</br> Phone: 04 9999 9999";

  // Adds the data to the content key
  var infowindow = new google.maps.InfoWindow({
    content: data
  });

  var map = new google.maps.Map($('.conf-map')[0], {
    zoom: 15,
    center: { lat: -37.817954, lng: 144.959257}
  });


  // console.log(map);

  var marker = new google.maps.Marker({
    position: {lat: -37.817954, lng: 144.959257},
    map: map,
    title: "WDI4 Conf"
  })

  // adds it to the infobox to this functions
  var markerInfoBox = function () {
      infowindow.open(map,marker);
  }

  // Calling the infobox function whenever the document loadsup
  markerInfoBox();


  var $color = $( ".color" )
  // $color.mouseover(function() {
  //   $(this).find('.sneak-peak').hide();
  // }).mouseout(function() {
  //   $(this).find('.sneak-peak').show();
  // });

  $color.mouseover(function() {
    $(this).addClass('active');
  }).mouseout(function() {
    $(this).removeClass('active');
  });


  var $sectionActive = $('section.active');
  var rgbaColor = "rgba(255, 0, 0, 0.5)";
  $sectionActive.css("background-color", rgbaColor);

  $.ajax({
    dataType: "json",
    url: "https://api.myjson.com/bins/4d5kx",
    data: data
  }).done(function (data) {
    for (var i = 0; i < data.length; i++) {
      //console.log(data[i].name);
    }
  });

  $("#qrcode").qrcode({
    "size": 100,
    "color": "#3a3",
    "fill": "red",
    "text": "GREGORY FERNANDES A18"
  });
});
