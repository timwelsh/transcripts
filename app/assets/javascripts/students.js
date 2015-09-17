$(function (){
  $('#student_dob').datepicker({
    dateFormat: 'mm/dd/yy',
    changeYear: true,
    changeMonth: true,
    startDate: '01/01/1950',
    endDate: '01/01/2050'

  })
  .on('changeDate', function(e) {
    // Revalidate the date field
    $('#new_student ').bootstrapValidator('revalidateField', 'student[dob]');
  });

  $('#student_enroll_date').datepicker({
    dateFormat: 'mm/dd/yy',
    changeYear: true,
    changeMonth: true,
    yearRange: "1950:2050"
  });
  $('#student_graduation_date').datepicker({
    dateFormat: 'mm/dd/yy',
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


    var x=1;
  $(add_button).click(function(e){ //on add input button click
    e.preventDefault();
    if (x >= 15) return;

    x++; 
    $(wrapper).append('<div id= edu_'+x+' class="education secondEdu">'+
      '<div class="panel-heading student-class">'+
      '<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><div class="rptrq3">Class '+x+'</div></div>'+
      '<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 rptrq1">'+
      '<a id='+x+' href="#" class="btn btn-danger remove_field">Remove</a>'+
      '</div>'+
      '</div>'+

      '<div style="clear:both;"></div>'+
      '<div class="row">'+
      '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">'+
      '<div class="form-group">'+
      '<label class="col-sm-12 adnwstdnt">Year</label>'+
      '<div class="col-sm-12">'+
      '<select class="form-control" name="completion_year[]">'+
      '<option value ="">Select Year</option>'+
      '<option value ="Freshman">Freshman</option>'+
      '<option value ="Sophomore">Sophomore</option>'+
      '<option value ="Junior">Junior</option>'+
      '<option value ="Senior">Senior</option>'+

      '</select>'+
      '</div>'+
      '</div>'+
      '</div>'+
      '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">'+
      '<div class="form-group">'+
      '<label  class="col-sm-12 adnwstdnt">Subject</label>'+
      '<div class="col-sm-12">'+
      '<input class="form-control" type="text" name="subject[]">'+
      '</div>'+
      '</div>'+
      '</div>'+
      '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">'+
      '<div class="form-group">'+
      '<label  class="col-sm-12 adnwstdnt">Course Name</label>'+
      '<div class="col-sm-12">'+
      '<input class="form-control" type="text" name="course_name[]">'+
      '</div>'+
      '</div>'+
      '</div>'+
      '</div>'+
      '<div class="row">'+
      '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">'+
      '<div class="form-group">'+
      '<label  class="col-sm-12 adnwstdnt">Honors</label>'+
      '<div class="col-sm-12">'+
      '<select class="form-control" name="honors[]">'+
      '<option value ="No">No</option>'+
      '<option value ="Yes">Yes</option>'+
      '</select>'+
      '</div>'+
      '</div>'+
      '</div>'+
      '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">'+
      '<div class="form-group">'+
      '<label  class="col-sm-12 adnwstdnt">Grade</label>'+
      '<div class="col-sm-12">'+
      '<select class="form-control" name="grade[]">'+
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
      '</div>'+
      '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">'+
      '<div class="form-group">'+
      '<label  class="col-sm-12 adnwstdnt">Credit</label>'+
      '<div class="col-sm-12">'+
      '<select class="form-control" name="credits[]">'+
      '<option value ="0.5">0.5</option>'+
      '<option value ="1.0">1.0</option>'+
      '<option value ="2.0">2.0</option>'+
      '</select>'+
      '</div>'+  
      '</div>'+
      '</div>'+
      '</div>'+



      '<input type="hidden" name="total_credit[]">'+
      '<input type="hidden" name="gpa_credit[]">'+
      '<input type="hidden" name="gpa_points[]">'+
      '<input type="hidden" name="cumulative_gpa[]">'+

      '</div>'
      ); 
});

  $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
    // e.preventDefault(); 
    //$(this).parent('div').remove();
    var id=$(this).attr("id");
    $('#edu_'+id).remove();
    x--;
  }); 

  var today = new Date();
  var previousdate = new Date(today.getFullYear(), today.getMonth(), today.getDate() - 1);
  var DOBMaxDate = $.datepicker.formatDate('mm/dd/yy', new Date(previousdate));
  

  $('#new_student ').bootstrapValidator({
    framework: 'bootstrap',
    icon: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      'student[first_name]': {
        validators: {
          notEmpty: {
            message: 'First Name is required'
          },
          stringLength: {
            message: 'First Name must be less than 50 characters',
            max: 50
          }
        }
      },
      'student[last_name]': {
        validators: {
          notEmpty: {
            message: 'Last Name is required'
          },
          stringLength: {
            message: 'Last Name must be less than 50 characters',
            max: 50
          }
        }
      },
      'student[email]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Email is required'
          },
          regexp: {
            regexp: '^[^\.][^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
            message: 'This is not a valid email address'
          }
        }
      },
      'student[dob]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Date of Birth is required'
          },
          date: {
            format: 'MM/DD/YYYY',
            min: '01/01/1950',
            max: DOBMaxDate,
            message: 'Date of Birth should be less than current date'
          }
        }
      },
      'student[enroll_date]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Enrollment Date is required'
          },
          date: {
            format: 'MM/DD/YYYY',
            min: 'student[dob]',
            max: DOBMaxDate,
            message: 'Enrollment date must be greater than Date of Birth'
          }
        }
      },
      'student[graduation_date]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Graduation Date is required'
          },
          date: {
            format: 'MM/DD/YYYY',
            min: 'student[enroll_date]',
            max: DOBMaxDate,
            message: 'Graduation date must be greater than Enrollment date'
          }
        }
      },
      'student[country]': {
        validators: {
          notEmpty: {
            message: 'Country is required'
          }
        }
      },
      'student[phone]': {
        validators: {
          stringLength: {
            message: 'Phone Number should be less than 15 characters',
            max: 15
          }
        }
      },
      'student[zip]': {
        validators: {
          stringLength: {
            message: 'Zip Code should be 7 characters long',
            max: 7
          }
        }
      }
    }
  });

  $('.edit_student').bootstrapValidator({
    framework: 'bootstrap',
    icon: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      'student[first_name]': {
        validators: {
          notEmpty: {
            message: 'First Name is required'
          },
          stringLength: {
            message: 'First Name must be less than 50 characters',
            max: 50
          }
        }
      },
      'student[last_name]': {
        validators: {
          notEmpty: {
            message: 'Last Name is required'
          },
          stringLength: {
            message: 'Last Name must be less than 50 characters',
            max: 50
          }
        }
      },
      'student[email]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Email is required'
          },
          regexp: {
            regexp: '^[^\.][^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
            message: 'This is not a valid email address'
          }
        }
      },
      'student[dob]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Date of Birth is required'
          },
          date: {
            format: 'MM/DD/YYYY',
            min: '01/01/1950',
            max: DOBMaxDate,
            message: 'Date of Birth should be less than current date'
          }
        }
      },
      'student[enroll_date]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Enrollment Date is required'
          },
          date: {
            format: 'MM/DD/YYYY',
            min: 'student[dob]',
            max: DOBMaxDate,
            message: 'Enrollment date must be greater than Date of Birth'
          }
        }
      },
      'student[graduation_date]': {
        trigger: 'change focus',
        validators: {
          notEmpty: {
            message: 'Graduation Date is required'
          },
          date: {
            format: 'MM/DD/YYYY',
            min: 'student[enroll_date]',
            max: DOBMaxDate,
            message: 'Graduation date must be greater than Enrollment date'
          }
        }
      },
      'student[country]': {
        validators: {
          notEmpty: {
            message: 'Country is required'
          }
        }
      },
      'student[phone]': {
        validators: {
          stringLength: {
            message: 'Phone Number should be less than 15 characters',
            max: 15
          }
        }
      },
      'student[zip]': {
        validators: {
          stringLength: {
            message: 'Zip Code should be 7 characters long',
            max: 7
          }
        }
      }
    }
  });      
});