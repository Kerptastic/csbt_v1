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
     * @type {*}
     */
    self.newTourneyName = ko.observable('');


    self.oilPatternIds = [];

    self.oilPatterns = ko.observableArray();

    self.selectedOilPatternId = ko.observable(0);


    self.bowlingCenterIds = [];

    self.bowlingCenters = ko.observableArray();

    self.selectedBowlingCenterId = ko.observable(0);

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


        self.listeners.push(self.selectedOilPatternId.subscribe(function (newValue) {
            if(self.oilPatterns().length > 0) {
                self.updateCurrentOilPattern(self.oilPatterns()[
                    self.oilPatternIds.indexOf(newValue)]);
            }
        }))

        self.listeners.push(self.selectedBowlingCenterId.subscribe(function (newValue) {
            if(self.bowlingCenters().length > 0) {
                self.updateCurrentBowlingCenter(self.bowlingCenters()[
                    self.bowlingCenterIds.indexOf(newValue)]);
            }
        }))
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

        if(newValue != self.previousSeason)
        {
            self.previousSeason = self.currentSeason();

            $('#index-form').submit();
        }
    };

    /**
     *
     * @param index
     */
    self.updateCurrentOilPattern = function(pattern) {
        $('#update-oil-pattern-form #name').val(pattern.name);
        $('#update-oil-pattern-form #url').val(pattern.url);
        $('#update-oil-pattern-form #id').val(pattern.id);
    }

    /**
     *
     * @param index
     */
    self.updateCurrentBowlingCenter = function(bowlingCenter) {

    }
};


var tourneyViewModel = new TournamentViewModel();

loadOilPatterns = function() {
    $.ajax({
        type: 'GET',
        url: '/oil_patterns',
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                tourneyViewModel.oilPatterns.push({
                    id: data[i].id,
                    name: data[i].name,
                    url: data[i].url
                });

                tourneyViewModel.oilPatternIds.push("" + data[i].id);
            }

            tourneyViewModel.updateCurrentOilPattern(
                tourneyViewModel.oilPatterns()[tourneyViewModel.oilPatternIds.indexOf(
                    tourneyViewModel.selectedOilPatternId())]);
        },
        error: function (data) {
        }
    });
};

loadBowlingCenters = function() {

};

/**
 *
 */
$(document).ready(function() {
    tourneyViewModel.init();

    loadOilPatterns();
    loadBowlingCenters();

    ko.applyBindings(tourneyViewModel, document.getElementById('tournaments-index'));
    ko.applyBindings(tourneyViewModel, document.getElementById('new-tournament-form'));
});