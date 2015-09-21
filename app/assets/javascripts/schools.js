$(document).ready(function(){

  $('select#school_country').val('US');
  if(document.URL.indexOf("schools/new") > -1){
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

  $('.submittable').click(function() {
    var url='';
    var id_name = '';
    if(window.location.pathname==='/schools/new')
    {
      url = '/schools/user_detail_copy';
      id_name = "school";
    }
    else
    {
      url = '/schools/school_detail_copy';
      id_name = "student";
    }

    if($('.submittable').is(":checked"))
    {
      $.ajax({
        type: 'GET',
        url: url,
        dataType: 'JSON',
        success: function(data){
          $('#'+id_name+'_address1').val(data.address1);
          $('#'+id_name+'_address2').val(data.address2);
          $('#'+id_name+'_address3').val(data.address3);
          $('#'+id_name+'_city').val(data.city);
          $('#'+id_name+'_zip').val(data.zip);
          $('#'+id_name+'_country').val(data.country);
          select_wrapper = $('#order_state_code_wrapper');
          $('select', select_wrapper).attr('disabled', true);
          country_code = data.country;
          url = "/schools/subregion_options?parent_region="+country_code;
          select_wrapper.load(url, function(){
            $('#'+id_name+'_state').val(data.state);
          });
          $('#'+id_name+'_phone').val(data.phone);
          $('#'+id_name+'_email').val(data.email).focus();
        },
        error: function(){
          console.log("Some error occur..");
        }
      });
    }
    else
    {
      $('#'+id_name+'_address1').val('');
      $('#'+id_name+'_address2').val('');
      $('#'+id_name+'_address3').val('');
      $('#'+id_name+'_city').val('');
      $('#'+id_name+'_zip').val('');
      $('#'+id_name+'_country').val('US');
      url = "/schools/subregion_options?parent_region=US";
      select_wrapper.load(url);
      $('#'+id_name+'_phone').val('');
      $('#'+id_name+'_email').val('');
    } 
  });

  $('#new_school').bootstrapValidator({
    framework: 'bootstrap',
    fields: {
        'school[school_name]': {
            validators: {
                notEmpty: {
                    message: 'School Name is required'
                },
                stringLength: {
                    message: 'School Name must be less than 150 characters',
                    max: 150
                }
            }
        },
        'school[admin_name]': {
          validators: {
              notEmpty: {
                  message: 'Admin Name is required'
              },
              stringLength: {
                  message: 'Admin Name must be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[address1]': {
          validators: {
              stringLength: {
                  message: 'Address Line 1 should be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[address2]': {
          validators: {
              stringLength: {
                  message: 'Address Line 2 should be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[address3]': {
          validators: {
              stringLength: {
                  message: 'Address Line 3 should be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[country]': {
          validators: {
              notEmpty: {
                  message: 'Country Name is required'
              },
          }
        },
        'school[city]': {
          validators: {
              stringLength: {
                  message: 'City should be less than 20 characters',
                  max: 20
              }
          }
        },
        'school[zip]': {
          validators: {
              stringLength: {
                  message: 'Zip Code should be 7 characters long',
                  max: 7
              }
          }
        },
        'school[phone]': {
          validators: {
            stringLength: {
                message: 'Phone Number should be less than 15 characters',
                max: 15
            }
          }
        },
        'school[email]': {
            validators: {
              notEmpty: {
                message: 'Email is required'
                },
              regexp: {
                regexp: '^[^\.][^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                message: 'This is not a valid email address'
              }
            }
          }
        
        
    }
  });
  $('.edit_school').bootstrapValidator({
    framework: 'bootstrap',
    fields: {
        'school[school_name]': {
            validators: {
                notEmpty: {
                    message: 'School Name is required'
                },
                stringLength: {
                    message: 'School Name must be less than 150 characters',
                    max: 150
                }
            }
        },
        'school[admin_name]': {
          validators: {
              notEmpty: {
                  message: 'Admin Name is required'
              },
              stringLength: {
                  message: 'Admin Name must be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[address1]': {
          validators: {
              stringLength: {
                  message: 'Address Line 1 should be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[address2]': {
          validators: {
              stringLength: {
                  message: 'Address Line 2 should be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[address3]': {
          validators: {
              stringLength: {
                  message: 'Address Line 3 should be less than 50 characters',
                  max: 50
              }
          }
        },
        'school[country]': {
          validators: {
              notEmpty: {
                  message: 'Country Name is required'
              },
          }
        },
        'school[city]': {
          validators: {
              stringLength: {
                  message: 'City should be less than 20 characters',
                  max: 20
              }
          }
        },
        'school[zip]': {
          validators: {
              stringLength: {
                  message: 'Zip Code should be 7 characters long',
                  max: 7
              }
          }
        },
        'school[phone]': {
          validators: {
            stringLength: {
                message: 'Phone Number should be less than 15 characters',
                max: 15
            }
          }
        },
        'school[email]': {
            validators: {
              notEmpty: {
                message: 'Email is required'
                },
              regexp: {
                regexp: '^[^\.][^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                message: 'This is not a valid email address'
              }
            }
          }
        
        
    }
    });
 

});