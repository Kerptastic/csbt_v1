/**
 *
 *
 */
var BowlerSearchViewModel = function() {
    /**
     *
     * @type {*}
     */
    var self = this;
    /**
     *
     * @type {*}
     */
    self.previousChosenLetter = 'A';
    /**
     *
     * @type {*}
     */
    self.currentChosenLetter = ko.observable('');

    /**
     *
     */
    self.init = function() {
        toggleChosenLetterStyle(self.previousChosenLetter, self.previousChosenLetter);
    };

    /**
     *
     */
    self.loadBowlers = function(newValue) {
        $('#chosenletter').val(newValue);

        self.currentChosenLetter(newValue);

        if(newValue != self.previousChosenLetter)
        {
            toggleChosenLetterStyle(self.previousChosenLetter, self.currentChosenLetter());

            self.previousChosenLetter = self.currentChosenLetter();

            $('#bowler-list-form').submit();
        }
    };
};

var toggleChosenLetterStyle = function(previous, current) {
    $('#' + previous).removeClass('selected-alpha-link');
    $('#' + previous).hover(function() {
        $(this).addClass('selected-alpha-link:hover'); }, function() {
        $(this).removeClass('selected-alpha-link:hover');
    });

    $('#' + current).addClass('selected-alpha-link');
    $('#' + current).hover(function() {
        $(this).addClass('selected-alpha-link:hover'); }, function() {
        $(this).removeClass('selected-alpha-link:hover');
    });
};


var bowlerSearchViewModel = new BowlerSearchViewModel();


/**
 *
 */
$(document).ready(function() {
    bowlerSearchViewModel.init();

    ko.applyBindings(bowlerSearchViewModel, document.getElementById('bowler-search'));
});