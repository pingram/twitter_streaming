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
  $('div .date').each(function () {
    $div = $(this);
    $div.html(prettyDate($div.attr('data-date')));
  })
}, 5000);

function appendStatus(status) {
  var $divRow = $('<div>').addClass('row');
  var $divText = $('<div>').text(status.text).addClass('col-xs-8 col-xs-offset-1');
  var $divTime = $('<div>').addClass('date')
    .attr('data-date', status.created_at)
    .text(prettyDate(status.created_at))
    .addClass('col-xs-3');

  $divRow.append($divText).append($divTime);
  $('#status-list').prepend($divRow);
}