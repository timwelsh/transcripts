
$(document).ready(function(){
	$('select#school_country').change(function(){
		select_wrapper = $('#order_state_code_wrapper');
		$('select', select_wrapper).attr('disabled', true);
		country_code = $(this).val();
		url = "/schools/subregion_options?parent_region="+country_code;
		select_wrapper.load(url);
	});

    // var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID

    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        // if(x < max_fields){ //max input box allowed
            x++; //text box increment
        $(wrapper).append('<div>'+
            '<h3>Educational Detail '+x+'</h3> <a href="#" class="remove_field">Remove</a>'+
            '<div class="field">'+
            '<label for="grad_name">Graduation Name</label><br>'+
            '<input type="text" name="grad_name[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="completion_year">Completion Year</label><br>'+
            '<input type="text" name="completion_year[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="description">Description</label><br>'+
            '<input type="text" name="description[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="subject">Subject</label><br>'+
            '<input type="text" name="subject[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="course_name">Course Name</label><br>'+
            '<input type="text" name="course_name[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="honors">Honors</label><br>'+
            '<input type="text" name="honors[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="grade">Grade</label><br>'+
            '<input type="text" name="grade[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="credits">Credits</label><br>'+
            '<input type="text" name="credits[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="total_credit">Total Credit</label><br>'+
            '<input type="text" name="total_credit[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="gpa_credit">Gpa Credit</label><br>'+
            '<input type="text" name="gpa_credit[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="gpa_points">Gpa Points</label><br>'+
            '<input type="text" name="gpa_points[]">'+
            '</div>'+

            '<div class="field">'+
            '<label for="cumulative_gpa">Cumulative Gpa</label><br>'+
            '<input type="text" name="cumulative_gpa[]">'+
            '</div>'+
            '</div>'); //add input box
        // }
    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        // e.preventDefault(); 
        $(this).parent('div').remove();
        x--;
    })
});