$(function (){
        $('#student_dob').datepicker();
        $('#student_enroll_date').datepicker();
        $('#student_graduation_date').datepicker();
        
});

$(document).ready(function(){
	$('select#student_country').change(function(){
		select_wrapper = $('#order_state_code_wrapper');
		$('select', select_wrapper).attr('disabled', true);
		country_code = $(this).val();
		url = "/students/subregion_options?parent_region="+country_code;
		select_wrapper.load(url);
	});
});