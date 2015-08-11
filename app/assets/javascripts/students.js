$(function (){
    $('#student_dob').datepicker({
        dateFormat: 'dd-mm-yy',
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
        
    });
    $('#student_enroll_date').datepicker({
      dateFormat: 'dd-mm-yy',
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
    });
    $('#student_graduation_date').datepicker({
        minDate: '-20Y',
        dateFormat: 'dd-mm-yy',
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
    });
   
    });

$(document).ready(function(){
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    var x = 1;    
    var xval = $("#xval").val();
     //debugger
        if (typeof xval !== 'undefined' )
        {
            x=$("#xval").val();
        }
    // alert(xval);

    $('select#student_country').val('US');

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


    
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();


        x++; 
        $(wrapper).append('<div class="education secondEdu">'+
            '<h3>Course '+x+'</h3> <a href="#" class="remove_field">Remove</a>'+
            '<div style="clear:both;"></div>'+
            '<ol><li class="string input optional stringish">'+
               '<label for="completion_year">Completion Year</label>'+
               '<select name="completion_year[]">'+
                 '<option value ="Freshman">Freshman</option>'+
                 '<option value ="Sophomore">Sophomore</option>'+
                 '<option value ="Junior">Junior</option>'+
                 '<option value ="Senior">Senior</option>'+
                 
               '</select>'+
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
               '<select name="honors[]">'+
                 '<option value ="No">No</option>'+
                 '<option value ="Yes">Yes</option>'+
               '</select>'+
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

    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        // e.preventDefault(); 
        $(this).parent('div').remove();
        x--;
    });
    
});