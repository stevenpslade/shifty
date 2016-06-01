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
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require turbolinks
//= require tether
//= require bootstrap-sprockets
//= require_tree .
$(function() {

  // trigger facebook JS SDK logout function
  // this should allow the user to logout of app and FB
  // so if a new user wants to sign in, they can do so
  // buggy right now; defaults to last user signed in
  $('a#logout').click(function(e) {
    e.preventDefault();
    FB.logout();
    location.href = "/logout";
  });

  //jquery ui function to use calender in shift edit/new form
  $('#shift_start_date').datepicker({
    dateFormat: "yy-mm-dd"
  });

  //using jquery to add css to calendar if shift is night or day
  $('li.night').closest('td').addClass("night-shift");
  $('li.day').closest('td').addClass("day-shift");

  $('[data-toggle="tooltip"]').tooltip();

});