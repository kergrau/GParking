// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
function onMapClick(e) {
  popup
  .setLatLng(e.latlng)
  .setContent("Your ubication " + e.latlng.toString())
  .addTo(mymap);
coordinate = popup.getLatLng();
document.getElementById('latitude').value = coordinate.lat;
document.getElementById('longitude').value = coordinate.lng;
console.log(coordinate.lat);
}