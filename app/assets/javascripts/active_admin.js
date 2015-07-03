//= require active_admin/base
$(document).ready(function(){
	$('select#user_country').val('US');
	$('select#school_country').val('US');
	$('select#user_status').val(1);
	$('select#user_country').change(function(){
		select_wrapper = $('#user_state');
		$('select', select_wrapper).attr('disabled', true);
		country_code = $(this).val();
		url = "/user/registrations/subregion_options?parent_region="+country_code;
		select_wrapper.load(url);
	});
	if(document.referrer.contains("user_id")){
		var id = document.referrer.split('user_id=')[1]
		$('select#school_user_id').val(id);
	}
});
