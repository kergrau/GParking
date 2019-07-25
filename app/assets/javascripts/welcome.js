// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
function WelcomeView() {
  $("[data-clipped-circle-graph]").each(function() {
    var $graph = $(this),
        percent = parseInt($graph.data('percent'), 10),
        deg = 30 + (300*percent)/100;
    if(percent > 50) {
      $graph.addClass('gt-50');
    }
    $graph.find('.clipped-circle-graph-progress-fill').css('transform','rotate('+ deg +'deg)');
    $graph.find('.clipped-circle-graph-percents-number').html(percent+'%');
  });
    
}
function mymap() {
    return mymap = L.map('mapid').setView([11.000000, -74.806984], 13);

}


function createMap() {
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1Ijoic3luYXBrZyIsImEiOiJjanlhcHZ5c3EwMTU1M21yd2YwZTNzdWkzIn0.YteazFgKGN-GPb2yS2tPWA'
    }).addTo(mymap());
    L.Control.geocoder().addTo(mymap());
}

function allOne() {
    mapboxgl.accessToken = 'pk.eyJ1Ijoic3luYXBrZyIsImEiOiJjanlhcHZ5c3EwMTU1M21yd2YwZTNzdWkzIn0.YteazFgKGN-GPb2yS2tPWA';
    var map = new mapboxgl.Map({
        container: 'map', // container id
        style: 'mapbox://styles/mapbox/streets-v11', // stylesheet location
        center: [-74.50, 40], // starting position [lng, lat]
        zoom: 9 // starting zoom
    });
}