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
        //var form = document.getElementById("season-form");

        $('#season').val(self.currentSeason());

        if(newValue != self.previousSeason)
        {
            self.previousSeason = self.currentSeason();

            $('#season-form').submit();
        }


//        $.ajax({
//            url: "/tournaments/" + self.currentSeason(),
//            type: "GET",
//            dataType: "json",
//            success: function(data, status, other) {
//                //self.currentSeasonTourneys(data);
//
//                //alert("data retrieved");
//
//
//            },
//            error: function(data, status, other) {
//
//            }
//        });
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