/**
 *
 *
 */
var BowlerViewModel = function() {
    /**
     *
     * @type {*}
     */
    var self = this;
    /**
     *
     * @type {Array}
     */
    self.listeners = [];
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
    self.addListeners = function() {

    };

    /**
     *
     */
    self.removeListeners = function() {

    };

    /**
     *
     */
    self.resetListeners = function() {
        self.removeListeners();
        self.addListeners();
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
    }
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


var bowlerViewModel = new BowlerViewModel();


/**
 *
 */
$(document).ready(function() {
    bowlerViewModel.init();

    ko.applyBindings(bowlerViewModel, document.getElementById('bowlers-index'));
});