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
    self.bowlerFirstName = ko.observable('');
    /**
     *
     * @type {*}
     */
    self.bowlerLastName = ko.observable('');

    /**
     *
     */
    self.init = function() {
    
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
};

var bowlerViewModel = new BowlerViewModel();


/**
 *
 */
$(document).ready(function() {
    bowlerViewModel.init();

    ko.applyBindings(bowlerViewModel, document.getElementById('bowlers'));
});