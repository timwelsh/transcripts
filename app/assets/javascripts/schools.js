$(document).ready(function(){

    $('select#school_country').val('US');
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
        //url = "/schools/subregion_options?parent_region=US";

        select_wrapper.load(url);
    });

    $('.submittable').click(function() {
        // $.get("/schools/user_detail_copy" , function(data){
        //     alert(data);
        // });
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
                   // $('#'+id_name+'_country option:selected').attr("selected",null);
                    //$('#'+id_name+'_country option[value="'+data.country+'"]').attr("selected","selected");
                   $('#school_country').val(data.country);
                    // select_wrapper = $('#order_state_code_wrapper');
                    // $('select', select_wrapper).attr('disabled', true);
                    // country_code = data.country;
                    // url = "/schools/subregion_options?parent_region="+country_code;
                    // select_wrapper.load(url);
                    $('#school_state').val(data.state);
                    $('#'+id_name+'_phone').val(data.phone);
                    $('#'+id_name+'_email').val(data.email);
                },
            error: function(){
                alert("Some error occur..");
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
        $(''+id_name+'_country option:selected').attr("selected",null);
        $('#'+id_name+'_country option[value="Please select a country"]').attr("selected","selected");
       // $('#school_country').val(data.country);
        
        url = "/schools/subregion_options?parent_region=US";
        select_wrapper.load(url);
        //$('#'+id_name+'_state').val('');
        $('#'+id_name+'_phone').val('');
        $('#'+id_name+'_email').val('');
    } 
});
});