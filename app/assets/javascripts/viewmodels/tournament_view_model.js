/**
 *
 *
 */
var TournamentViewModel = function() {
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
    self.previousSeason = '2012-2013';
    /**
     *
     * @type {*}
     */
    self.currentSeason = ko.observable('');

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
     */
    self.selectedSeasonChanged = function(newValue) {
        $('#index').val(self.currentSeason());

        if(newValue != self.previousSeason)
        {
            self.previousSeason = self.currentSeason();

            $('#index-form').submit();
        }
    };
};


var tourneyViewModel = new TournamentViewModel();

/**
 *
 */
$(document).ready(function() {
    tourneyViewModel.init();

    ko.applyBindings(tourneyViewModel, document.getElementById('tournaments-index'));
});