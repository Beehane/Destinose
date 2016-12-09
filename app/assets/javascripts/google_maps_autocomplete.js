$(document).ready(function() {
  var city = document.getElementById(input);
  var searchBox = new google.maps.places.SearchBox(input);

    google.maps.event.addDomListener(window, 'load', function() {
  $('.controls').val(placeholder);
  $("city").focus();
    $('./results').submit(function(){
    });

  });
});


//   if (city) {
//     var autocomplete = new google.maps.places.Autocomplete(city, { types: ['geocode'] });
//     google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
//     google.maps.event.addDomListener(city, 'keydown', function(e) {
//       if (e.keyCode == 13) {
//         e.preventDefault(); // Do not submit the form on Enter.
//       }
//     });
//   }
// });

// function onPlaceChanged() {
//   var place = this.getPlace();
//   var components = getAddressComponents(place);

//   $('#city').trigger('blur').val(components.city);
//   if (components.country_code) {
//     $('#city_country').val(components.country_code);
//   }
// }

// function getAddressComponents(place) {
//   // If you want lat/lng, you can look at:
//   // - place.geometry.location.lat()
//   // - place.geometry.location.lng()

//   var city = null;
//   var country_code = null;
//   for (var i in place.address_components) {
//     var component = place.address_components[i];
//     for (var j in component.types) {
//       var type = component.types[j];
//       if (type == 'locality') {
//         city = component.long_name;
//       } else if (type == 'country') {
//         country_code = component.short_name;
//       }
//     }
//   }

//   return {
//     city: city,
//     country_code: country_code
//   };
// }
