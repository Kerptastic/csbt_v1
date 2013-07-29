/**
 *
 *
 */
var RecordsViewModel = function() {
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
    self.previousCategory = '';
    /**
     *
     * @type {*}
     */
    self.currentCategory = ko.observable('');
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
        self.listeners.push(self.currentCategory.subscribe(function (newValue) {
            self.selectedCategoryChanged(newValue);
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
    self.selectedCategoryChanged = function(newValue) {
        $('#category').val(self.currentCategory());

        if(newValue != self.previousCategory)
        {
            self.previousCategory = self.currentCategory();

            $.ajax({
                url: "/records/" + $('#category-select')[0].value,
                type: "GET"
            });
        }
    };
};


var recordsViewModel = new RecordsViewModel();


/**
 *
 */
$(document).ready(function() {
    recordsViewModel.init();

    ko.applyBindings(recordsViewModel, document.getElementById('records-index'));
});