initializeTourneyDatePicker = function() {
    var dateParts =  $('#tournament_date').val().split('-');
    var tourneyDate = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], 0, 0, 0, 0);

    $('#date-picker').datepicker('setValue', tourneyDate).on('changeDate', function(ev) {
        $('#tournament_date').val(new Date(ev.date));
    });
};
