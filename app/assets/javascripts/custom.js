$(document).on('turbolinks:load', function() {
  $('#onlinepayment').click(function() {
    $('#nganluong').attr('style','display: block');
  });
  $('#pod').click(function() {
    $('#nganluong').attr('style','display: none');
  });
});
var geocoder, location1, location2, fee;
function initialize() {
  geocoder = new GClientGeocoder();
}

function showLocation() {
  var address1 = document.getElementById('address1').value;
  var address2 = document.getElementById('address2').value;
  geocoder.getLocations(address1, function(response) {
    if (!response || response.Status.code != 200)
    {
      alert("Sorry, we were unable to geocode the first address");
    }
    else
    {
      location1 = {lat: response.Placemark[0].Point.coordinates[1], lon: response.Placemark[0].Point.coordinates[0], address: response.Placemark[0].address};
      geocoder.getLocations(address2, function (response) {
        if (!response || response.Status.code != 200)
        {
          alert("Sorry, we were unable to geocode the second address");
        }
        else
        {
          location2 = {lat: response.Placemark[0].Point.coordinates[1], lon: response.Placemark[0].Point.coordinates[0], address: response.Placemark[0].address};
          calculateDistance();
        }
      });
    }
  });
}

function calculateDistance()
{
  try
  {
    var glatlng1 = new GLatLng(location1.lat, location1.lon);
    var glatlng2 = new GLatLng(location2.lat, location2.lon);
    var miledistance = glatlng1.distanceFrom(glatlng2, 3959).toFixed(1);
    var kmdistance = (miledistance * 1.609344).toFixed(1);

    document.getElementById('results').innerHTML = '<strong>Khoảng cách: </strong>' + kmdistance + ' km';
    document.getElementById('savings').innerHTML = kmdistance * 5000;
    document.getElementById('fast').innerHTML = kmdistance * 10000 ;
    showTotalSavings();
  }
  catch (error)
  {
    alert(error);
  }
}

function showTotalSavings() {
  fee = document.getElementById('savings').innerHTML;
  showTotal();
}

function showTotalFast() {
  fee = document.getElementById('fast').innerHTML;
  showTotal();
}

function showTotal() {
  var totalproduct = document.getElementById('totalproduct').innerHTML;
  var total = Number(fee) + Number(totalproduct);
  document.getElementById('total').innerHTML = 'Total: ' + total + ' (VND)<hr>';
}
