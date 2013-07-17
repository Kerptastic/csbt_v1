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
    self.previousChosenLetter = "A";
    /**
     *
     * @type {*}
     */
    self.currentChosenLetter = ko.observable("");
    /**
     *
     * @type {*}
     */
    self.currentBowlers = ko.observableArray([]);

    /**
     *
     */
    self.init = function() {
        self.addListeners();
    };

    /**
     *
     */
    self.addListeners = function() {
//        self.listeners.push(self.currentSeason.subscribe(function (newValue) {
//            self.selectedSeasonChanged(newValue);
//        }));
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
            $('#' + self.previousChosenLetter).removeClass('selected-alpha-link');

            self.previousChosenLetter = self.currentChosenLetter();

            $('#bowler-list-form').submit();
        }

        $('#' + self.currentChosenLetter()).addClass('selected-alpha-link');
    }
};


var bowlerViewModel = new BowlerViewModel();

/**
 *
 */
$(document).ready(function() {
    bowlerViewModel.init();

    ko.applyBindings(bowlerViewModel, document.getElementById('someElementId'))
});