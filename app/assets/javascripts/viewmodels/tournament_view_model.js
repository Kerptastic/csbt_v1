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
    self.autoCompleteData = {};
    
    self.currentDirectedTourneyId = -1;
    
    self.currentTourneyName = ko.observable('');
    
    self.currentTourneyEntryIds = [];
    
    self.currentTourneyEntries = ko.observableArray();
    
	self.errorMsg = ko.observable('');
	
	
    self.oilPatternIds = [];

    self.oilPatterns = ko.observableArray();

    self.selectedOilPatternId = ko.observable(0);


    self.bowlingCenterIds = [];

    self.bowlingCenters = ko.observableArray();

    self.selectedBowlingCenterId = ko.observable(0);


	self.selectedBowlerToAdd = null;
	
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
        self.listeners.push(self.selectedOilPatternId.subscribe(function (newValue) {
            if(self.oilPatterns().length > 0) {
                self.updateCurrentOilPattern(self.oilPatterns()[
                    self.oilPatternIds.indexOf(newValue)]);
            }
        }));

        self.listeners.push(self.selectedBowlingCenterId.subscribe(function (newValue) {
            if(self.bowlingCenters().length > 0) {
                self.updateCurrentBowlingCenter(self.bowlingCenters()[
                    self.bowlingCenterIds.indexOf(newValue)]);
            }
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
     * @param index
     */
    self.updateCurrentOilPattern = function(pattern) {
        $('#update-oil-pattern-form #name').val(pattern.name);
        $('#update-oil-pattern-form #url').val(pattern.url);
        $('#update-oil-pattern-form #id').val(pattern.id);
    };

    /**
     *
     * @param index
     */
    self.updateCurrentBowlingCenter = function(center) {
		$('#update-bowling-center-form #name').val(center.name);
        $('#update-bowling-center-form #url').val(center.url);
        $('#update-bowling-center-form #id').val(center.id);
    };
    
    self.getEntries = function(tournamentId) {
    	self.currentDirectedTourneyId = tournamentId;
    	
    	$.ajax({
		        type: 'GET',
		        url: '/tournaments/' + tournamentId + '/entries',
		        dataType: "json",
		        success: function (data) {
		        	for (var i = 0; i < data.length; i++) {
                		tourneyViewModel.currentTourneyEntries.push({
		                    id: data[i].id,
		                    tourneyId: tournamentId,
		                    first_name: data[i].bowler.first_name,
		                    last_name: data[i].bowler.last_name
		                });
		           }
		        },
		        error: function (data) {
		        }
		    });	
    };
    
    self.addEntry = function(entry) {
		//ajax add an entry to the tournament
		//add below to the success method
		var bowlerId = self.selectedBowlerToAdd.id;
		
		if(self.currentTourneyEntryIds.indexOf(bowlerId) == -1) {
    		self.currentTourneyEntryIds.push(bowlerId);
   	    	tourneyViewModel.currentTourneyEntries.push(self.selectedBowlerToAdd);
   	   } else {
   	       //tell the view this bowler has been added alredy
   	   }
    };
    
    self.removeEntry = function() {
    	
    };
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
    $.ajax({
        type: 'GET',
        url: '/bowling_centers',
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                tourneyViewModel.bowlingCenters.push({
                    id: data[i].id,
                    name: data[i].name,
                    url: data[i].url
                });

                tourneyViewModel.bowlingCenterIds.push("" + data[i].id);
            }

            tourneyViewModel.updateCurrentBowlingCenter(
                tourneyViewModel.bowlingCenters()[tourneyViewModel.bowlingCenterIds.indexOf(
                    tourneyViewModel.selectedBowlingCenterId())]);
        },
        error: function (data) {
        }
    });
};

setupBowlerAutoComplete = function() {
	// $('.typeahead').typeahead({
		// updater: function(selection) {
			// tourneyViewModel.selectedBowlerToAdd = tourneyViewModel.autoCompleteData[selection];	
			// return selection;
		// },
        // source: function (query, process) {
	        // return $.ajax({
		        // type: 'GET',
		        // data: { last_name: query },
		        // url: '/bowlers/all',
		        // dataType: "json",
		        // success: function (data) {
		        	// var autoCompleteDropDown = [];
		        	// tourneyViewModel.autoCompleteData = {};
// 		        	
		        	// $.each(data, function (i, bowler) {
		        		// //need to make this work using unique values - bowlers can have the same name
		        		// tourneyViewModel.autoCompleteData[bowler.last_name + ", " + bowler.first_name] = bowler;
				        // autoCompleteDropDown.push(bowler.last_name + ", " + bowler.first_name);
				    // });
// 				    
		            // return process(autoCompleteDropDown);
		        // },
		        // error: function (data) {
		        // }
		    // });
    	// }
    // });
};

/**
 *
 */
$(document).ready(function() {
    tourneyViewModel.init();

    loadOilPatterns();
    loadBowlingCenters();
    
    setupBowlerAutoComplete();
    
    ko.applyBindings(tourneyViewModel, document.getElementById('tournaments-index'));
});