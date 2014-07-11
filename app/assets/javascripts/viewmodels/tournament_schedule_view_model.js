/**
 *
 *
 */
var TournamentScheduleViewModel = function() {
    /**
     *
     * @type {*}
     */
    var self = this;

    /**
     *
     * @type {*}
     */
    self.listeners = [];
    /**
     *
     * @type {*}
     */
    self.previousSeason = ko.observable('2013-2014');
    /**
     *
     * @type {*}
     */
    self.currentSeason = ko.observable('');
    /**
     * 
     * @type {*}
     */
	self.errorMsg = ko.observable('');

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
        self.listeners.push(self.currentSeason.subscribe(function (newValue) {
            self.selectedSeasonChanged(newValue);
        }));
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
     * @param newValue
     */
    self.selectedSeasonChanged = function(newValue) {
        $('#index').val(self.currentSeason());

        if(newValue != self.previousSeason()) {
            self.previousSeason(self.currentSeason());

            $('#index-form').submit();
        }
    };
};


var tourneyScheduleViewModel = new TournamentScheduleViewModel();


/**
 *
 */
$(document).ready(function() {
    tourneyScheduleViewModel.init();

    ko.applyBindings(tourneyScheduleViewModel, document.getElementById('tournaments-index'));
});