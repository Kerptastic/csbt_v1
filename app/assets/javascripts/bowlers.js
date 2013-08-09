initializeBirthdayPicker = function() {
    var dateParts =  $('#bowler_birthday').val().split('-');
    var birthday = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], 0, 0, 0, 0);

    $('#birthday-picker').datepicker('setValue', birthday).on('changeDate', function(ev) {
        $('#bowler_birthday').val(new Date(ev.date));
    });
};
