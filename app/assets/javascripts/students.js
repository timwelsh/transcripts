$(function (){
    $('#student_dob').datepicker({
        dateFormat: 'mm-dd-yy',
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
        
    });
    $('#student_enroll_date').datepicker({
      dateFormat: 'mm-dd-yy',
        changeYear: true,
        changeMonth: true,
        yearRange: "1950:2050"
    });
    $('#student_graduation_date').datepicker({
        dateFormat: 'mm-dd-yy',
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

    if(document.URL.indexOf("students") > -1){
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
            '<h3>Class '+x+'</h3> <a href="#" class="btn btn-danger remove_field">Remove</a>'+
            '<div style="clear:both;"></div>'+
            '<div class="row">'+
              '<div class="col-md-4">'+
                '<div class="string input optional stringish">'+
                  '<label for="completion_year">Year</label><br>'+
                  '<select name="completion_year[]">'+
                    '<option value ="">Please Select</option>'+
                    '<option value ="Freshman">Freshman</option>'+
                    '<option value ="Sophomore">Sophomore</option>'+
                    '<option value ="Junior">Junior</option>'+
                    '<option value ="Senior">Senior</option>'+
                     
                  '</select>'+
                '</div>'+
              '</div>'+
              '<div class="col-md-4">'+
                '<div class="string input optional stringish">'+
                  '<label for="subject">Subject</label><br>'+
                  '<input type="text" name="subject[]">'+
                '</div>'+
              '</div>'+
              '<div class="col-md-4">'+
                '<div class="string input optional stringish">'+
                  '<label for="course_name">Course Name</label><br>'+
                  '<input type="text" name="course_name[]">'+
                '</div>'+
              '</div>'+
            '</div>'+
            '<div class="row">'+
              '<div class="col-md-4">'+
                '<div class="string input optional stringish">'+
                   '<label for="honors">Honors</label><br>'+
                   '<select name="honors[]">'+
                     '<option value ="No">No</option>'+
                     '<option value ="Yes">Yes</option>'+
                   '</select>'+
                '</div>'+
              '</div>'+
              '<div class="col-md-4">'+
                '<div class="string input optional stringish">'+
                   '<label for="grade">Grade</label><br>'+
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
                '</div>'+
              '</div>'+
              '<div class="col-md-4">'+
                '<div class="string input optional stringish">'+
                 '<label for="credit">Credit</label><br>'+
                  '<select name="credits[]">'+
                   '<option value ="0.5">0.5</option>'+
                    '<option value ="1.0">1.0</option>'+
                    '<option value ="2.0">2.0</option>'+
                  '</div>'+
                  '</div>'+
                  '</div>'+
                  


            '<input type="hidden" name="total_credit[]">'+
            '<input type="hidden" name="gpa_credit[]">'+
            '<input type="hidden" name="gpa_points[]">'+
            '<input type="hidden" name="cumulative_gpa[]">'+
                        
            '</div>'); 

    });




$('#student_submit_action').click(function(event){
    var flag = true;
    var first_name = $("#student_first_name").val();
    var last_name = $("#student_last_name").val();
    var zip = $("#student_zip").val();
    var phone = $("#student_phone").val();
    var dob= $("#student_dob").val();
    var enroll_date=$("#student_enroll_date").val();
    var grad_date=$("#student_graduation_date").val();
    if (first_name==''){
        $('#first_name_error').html('First name can not be blank');
        flag=false; 
        
    }
    else{
         $('#first_name_error').html('');
    }

     if(last_name==''){
        $('#last_name_error').html('Last name can not be blank');
        flag=false; 
        
    }
    else{
         $('#last_name_error').html('');
    }

    if(dob==''){
        $('#student_dob_error').html('dob can not be blank');
        flag =false;
    }
    else{
         $('#student_dob_error').html('');
    }

    
    if(!$.isNumeric(zip) || zip.length!=5){
        $('#zip_error').html('Zip code should be integer and length should be 5 character');
        flag=false;

    }
    else{
        $('#zip_error').html('');
    }

     if(!$.isNumeric(phone) || phone.length!=10){
            $('#phone_error').html('Length should be integer and 10 numbers');
          
            flag=false;
       }
       else{
        $('#phone_error').html('');

       }



     if(enroll_date==''){
        $('#student_enroll_date_error').html('enroll_date can not be blank');
        flag =false;
    }

    else{
         $('#student_enroll_date_error').html('');

    }
if(grad_date==''){
        $('#student_graduation_date_error').html('graduation date can not be blank');
        flag =false;
    }
    else{
         $('#student_graduation_date_error').html('');
    }
    

    return flag;
    event.preventDefault();
});



    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        // e.preventDefault(); 
        $(this).parent('div').remove();
        x--;
    });
    

    
});