$(document).ready(function() {
    $('#new_user').bootstrapValidator({
        framework: 'bootstrap',
        fields: {
            'user[first_name]': {
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
            'user[last_name]': {
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
            'user[email]': {
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
            'user[password]': {
                validators: {
                    notEmpty: {
                        message: 'Password is required'
                    },
                    stringLength: {
                        message: 'Password must be greater than 8 characters',
                        min: 8
                    }
                }
            },
            'user[password_confirmation]': {
                validators: {
                    notEmpty: {
                        message: 'Confirm Password is required'
                    },
                    identical: {
                        field: 'user[password]',
                        message: 'Password and Confirm Password does not match'
                    }
                }
            },
            'user[phone]': {
                validators: {
                    stringLength: {
                        message: 'Phone Number should be less than 15 characters',
                        max: 15
                    }
                }
            },
            'user[zip]': {
                validators: {
                    stringLength: {
                        message: 'Zip Code should be 5 characters long',
                        max: 5
                    }
                }
            }
        }
    });
});