//= require active_admin/base
//= require bootstrap-sprockets
$(function (){
    $('#student_dob').datepicker({
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
    });
    $('#student_enroll_date').datepicker({
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
    });
    $('#student_graduation_date').datepicker({
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
    });
    $('.completion_year').each(function(){
        $('.completion_year').datepicker({
            changeYear: true,
            changeMonth: true,
            yearRange: "1950:2050"
        });
    })

});
$(document).ready(function(){
	var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    var x = 1;    
    var xval = $("#xval").val();
     // debugger
        if (typeof xval !== 'undefined' )
        {
            x=$("#xval").val();
        }
    // alert(xval);
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();


        x++; 
        $(wrapper).append('<div class="education secondEdu">'+
            '<h3>Course '+x+'</h3> <a href="#" class="remove_field">Remove</a>'+
            '<div style="clear:both;"></div>'+
            '<ol><li class="string input optional stringish">'+
            '<label for="grad_name">Graduation Name</label>'+
            '<input type="text" name="grad_name[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="completion_year">Completion Year</label>'+
            '<input type="text" name="completion_year[]" class="completion_year">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="description">Description</label>'+
            '<input type="text" name="description[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="subject">Subject(seperate subject via ,)</label>'+
            '<input type="text" name="subject[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="course_name">Course Name</label>'+
            '<input type="text" name="course_name[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="honors">Honors</label>'+
            '<input type="text" name="honors[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="grade">Grade(seperate grade via ,)</label>'+
            '<input type="text" name="grade[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="credits">Credits(seperate credits via ,)</label>'+
            '<input type="text" name="credits[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="total_credit">Total Credit</label>'+
            '<input type="text" name="total_credit[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="gpa_credit">Gpa Credit</label>'+
            '<input type="text" name="gpa_credit[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="gpa_points">Gpa Points</label>'+
            '<input type="text" name="gpa_points[]">'+
            '</li>'+

            '<li class="string input optional stringish">'+
            '<label for="cumulative_gpa">Cumulative Gpa</label>'+
            '<input type="text" name="cumulative_gpa[]">'+
            '</li></ol>'+
            '</div>'); 

        $('.completion_year').datepicker({
            changeYear: true,
            changeMonth: true,
            yearRange: "1950:2050"
        });
    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        // e.preventDefault(); 
        $(this).parent('div').remove();
        x--;
    });
    $('select#user_country').val('US');
    $('select#school_country').val('US');
    $('select#student_country').val('US');
    $('select#user_status').val(1);
    $('#user_state_input').append('<div id="order_state_code_wrapper"></div>');
    $('#user_state').remove();
    select_wrapper = $('#order_state_code_wrapper');
    $('select', select_wrapper).attr('disabled', true);
    url = "/user/registrations/subregion_options?parent_region=US";
    select_wrapper.load(url);

    $('select#user_country').change(function(){
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        country_code = $(this).val();
        url = "/user/registrations/subregion_options?parent_region="+country_code;
        select_wrapper.load(url);
    });


    $('#school_state_input').append('<div id="order_state_code_wrapper"></div>');
    $('#school_state').remove();
    select_wrapper = $('#order_state_code_wrapper');
    $('select', select_wrapper).attr('disabled', true);
    url = "/user/registrations/subregion_options?parent_region=US";
    select_wrapper.load(url);
    
    $('select#school_country').change(function(){
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        country_code = $(this).val();
        url = "/user/registrations/subregion_options?parent_region="+country_code;
        select_wrapper.load(url);
    });



    $('#student_state').wrap('<div id="order_state_code_wrapper"></div>');
    $('#student_state').remove();
    select_wrapper = $('#order_state_code_wrapper');
    $('select', select_wrapper).attr('disabled', true);
    url = "/user/registrations/subregion_options?parent_region=US";
    select_wrapper.load(url);
    
    $('select#student_country').change(function(){
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        country_code = $(this).val();
        url = "/user/registrations/subregion_options?parent_region="+country_code;
        select_wrapper.load(url);
    });


    if(document.referrer.contains("user_id")){
      var id = document.referrer.split('user_id=')[1]
      $('select#school_user_id').val(id);
    }

    if(document.referrer.contains("school_id")){
        var id = document.referrer.split('school_id=')[1]
        $('select#student_school_id').val(id);
    }

    $('body.show.admin_students #page_title').html("Student Detail");
    $('body.new.admin_students #page_title').html("Add Student Detail");

});

function printpage()
{
    window.print()
}
