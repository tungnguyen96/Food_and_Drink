$(document).on('turbolinks:load', function() {
  $('#onlinepayment').click(function() {
    $('#nganluong').attr('style','display: block');
  });
  $('#pod').click(function() {
    $('#nganluong').attr('style','display: none');
  });
});
