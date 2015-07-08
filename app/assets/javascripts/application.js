// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require fancybox
//= require fancybox-buttons
//= require fancybox-media
//= require fancybox-thumbs
//= require wow
//= require bootstrap-datepicker
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
	$('select#user_country').change(function(){
		select_wrapper = $('#order_state_code_wrapper');
		$('select', select_wrapper).attr('disabled', true);
		country_code = $(this).val();
		url = "/user/registrations/subregion_options?parent_region="+country_code;
		select_wrapper.load(url);
	});	
});
function printpage()
{
	window.print()
}

