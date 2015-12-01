$(document).ready(function (){

    function initialize() {
      var myLatlng = new google.maps.LatLng(latitude, longitude);
        
        
      var mapOptions = {
      center: myLatlng,
      zoom: 19,
      };
        
      var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);    
    }
      
    google.maps.event.addDomListener(window, 'load', initialize);
});