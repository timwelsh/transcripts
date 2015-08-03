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
            '<label for="subject">Subject</label>'+
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
             '<label for="grade">Grade</label>'+
              '<select name="grade[]">'+
               '<option value ="A+">A+</option>'+
                '<option value ="A">A</option>'+
                '<option value ="A-">A-</option>'+
                '<option value ="B+">B+</option>'+
                '<option value ="B">B</option>'+
                '<option value ="B-">B-</option>'+
                '<option value ="C+">C+</option>'+
                '<option value ="C">C</option>'+
                '<option value ="C-">C-</option>'+
                '<option value ="D+">D+</option>'+
                '<option value ="D">D</option>'+
                '<option value ="D-">D-</option>'+
                '<option value ="F">F</option>'+
                '<option value ="CR">CR</option>'+
                '<option value ="NC">NC</option>'+
                '<option value ="W">W</option>'+
                '<option value ="I">I</option>'+

              '</select>'+
            '</li>'+

            '<li class="string input optional stringish">'+
             '<label for="credit">Credit</label>'+
              '<select name="credits[]">'+
               '<option value ="0.5">0.5</option>'+
                '<option value ="1.0">1.0</option>'+
                '<option value ="2.0">2.0</option>'+
              '</li>'+

            '<input type="hidden" name="total_credit[]">'+
            '<input type="hidden" name="gpa_credit[]">'+
            '<input type="hidden" name="gpa_points[]">'+
            '<input type="hidden" name="cumulative_gpa[]">'+
            

            '</ol>'+
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
    var a =  $('#user_email_input p').html();
    if(a){
        var b = a.replace('and', '').trim(); 
        $('#user_email_input p').html(b);  
    }
    var c =  $('#school_email_input p').html();
    if(c){
        var d = c.replace('and', '').trim(); 
        $('#school_email_input p').html(d);  
    }
    var e =  $('#student_email_input p').html();
    if(e){
        var f = e.replace('and', '').trim(); 
        $('#student_email_input p').html(f);  
    }
    $('select#user_country').val('US');
    $('select#school_country').val('US');
    $('select#student_country').val('US');
    $('select#user_status').val(1);

    if(document.URL.contains("users")){
        $('#user_state_input').append('<div id="order_state_code_wrapper"></div>');
        $('#user_state').remove();
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        url = "/user/registrations/subregion_options?parent_region=US";
        select_wrapper.load(url);
    }
    
    $('select#user_country').change(function(){
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        country_code = $(this).val();
        url = "/user/registrations/subregion_options?parent_region="+country_code;
        select_wrapper.load(url);
    });

    if(document.URL.contains("schools")){
        $('#school_state_input').append('<div id="order_state_code_wrapper"></div>');
        $('#school_state').remove();
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        url = "/schools/subregion_options?parent_region=US";
        select_wrapper.load(url);
    }
    $('select#school_country').change(function(){
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        country_code = $(this).val();
        url = "/schools/subregion_options?parent_region="+country_code;
        select_wrapper.load(url);
    });


    if(document.URL.contains("students")){
        $('#student_state').wrap('<div id="order_state_code_wrapper"></div>');
        $('#student_state').remove();
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        url = "/students/subregion_options?parent_region=US";
        select_wrapper.load(url);
    }
    $('select#student_country').change(function(){
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        country_code = $(this).val();
        url = "/students/subregion_options?parent_region="+country_code;
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
