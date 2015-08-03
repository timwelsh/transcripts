$(function (){
    $('#student_dob').datepicker({
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
        // onClose: function(dateText, inst) {
        //  $('#year').val(dateText.split('/')[2]);
        //  $('#month').val(dateText.split('/')[0]);
        //  $('#day').val(dateText.split('/')[1]);
        // }
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

});

$(document).ready(function(){

    $('select#student_country').change(function(){
        select_wrapper = $('#order_state_code_wrapper');
        $('select', select_wrapper).attr('disabled', true);
        country_code = $(this).val();
        url = "/schools/2/students/subregion_options?parent_region="+country_code;
        select_wrapper.load(url);
    });

    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    var x = 1;    
    var xval = $("#xval").val();
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        // debugger
        if (typeof xval !== 'undefined' )
        {
            alert($("#xval").val()) ;
            x=$("#xval").val();
        }
        x++; 
        $(wrapper).append('<div>'+
            '<h3>Course '+x+'</h3> <a href="#" class="remove_field">Remove</a>'+
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

            
            '</div>'); //add input box
        // }
    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        // e.preventDefault(); 
        $(this).parent('div').remove();
        x--;
    });
});