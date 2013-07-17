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
     * @type {Array}
     */
    self.listeners = [];
    /**
     *
     * @type {*}
     */
    self.previousSeason = "2012-2013";
    /**
     *
     * @type {*}
     */
    self.currentSeason = ko.observable("");
    /**
     *
     * @type {*}
     */
    self.currentSeasonTourneys = ko.observableArray([]);

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
        $('#season').val(self.currentSeason());

        if(newValue != self.previousSeason)
        {
            self.previousSeason = self.currentSeason();

            $('#season-form').submit();
        }
    };
};


var tourneyViewModel = new TournamentViewModel();

/**
 *
 */
$(document).ready(function() {
    tourneyViewModel.init();

    ko.applyBindings(tourneyViewModel, document.getElementById('someElementId'))
});