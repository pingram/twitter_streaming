// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require pretty_date

setInterval(function(){
  $('span').each(function () {
    $span = $(this);
    $span.html(prettyDate($span.attr('data-date')));
  })
}, 5000);

function appendStatus(status) {
  var $liHtml = status.text
    + ' <span data-date=' + status.created_at + '>'
      + prettyDate(status.created_at)
    + '</span>';
  var $new_el = $('<li>').html($liHtml);
  $('#status-list').prepend($new_el);
}