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


function createMap(mymap) {

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1Ijoic3luYXBrZyIsImEiOiJjanlhcHZ5c3EwMTU1M21yd2YwZTNzdWkzIn0.YteazFgKGN-GPb2yS2tPWA'
    }).addTo(mymap);

}
/*
function markers(parking, type, value, latitude, longitude, mymap) {
    var marker = L.marker([latitude,longitude]).addTo(mymap);
    popup(parking, type, value, marker);
}
*/

function markers(type, value, start, end, name, latitude, longitude, mymap) {
    var marker = L.marker([latitude,longitude]).addTo(mymap);
    popup(type, value, start, end, name, marker);
}

function popup(type, value, start, end, name, marker) {
    string = `<pre style="text-align: center; font-weight: bold;
              background-color: white">${name}</pre>
              <b>${type}: </b>${value} $/min<br>
              <b>Starts: </b>${start}
              <b>Ends: </b>${end}`;

    marker.bindPopup(string);
}