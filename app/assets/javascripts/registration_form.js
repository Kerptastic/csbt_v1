
(function ($) {
    $.fn.formToWizard = function (options) {
        options = $.extend({
            submitButton: "submit-button"
        }, options);

        var element = this;

        var steps = $(element).find("fieldset");
        var count = steps.size();
        var submitButtonName = "#" + options.submitButton;
        $(submitButtonName).hide();

        // 2
        $(element).before("<ul id='steps'></ul>");

        steps.each(function (i) {
            $(this).wrap("<div id='step" + i + "'></div>");
            $(this).append("<div id='step" + i + "commands' class='controls'></div>");

            // 2
            //var name = $(this).find("legend").html();
            //$("#steps").append("<li id='stepDesc" + i + "'>Step " + (i + 1) + "<span> - " + name + "</span></li>");

            if (i == 0) {
                createNextButton(i);
                selectStep(i);
            }
            else if (i == count - 1) {
                $("#step" + i).hide();
                createPrevButton(i);
                createSubmitButton(i);
            }
            else {
                $("#step" + i).hide();
                createPrevButton(i);
                createNextButton(i);
            }
        });

        function createPrevButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<a href='#' id='" + stepName + "Prev' class='btn btn-primary reg-prev-button'>< Back</a>");

            $("#" + stepName + "Prev").bind("click", function (e) {
                $("#" + stepName).hide();
                $("#step" + (i - 1)).show();
                $(submitButtonName).hide();
                selectStep(i - 1);
            });
        }

        function createNextButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<a href='#' id='" + stepName + "Next' class='btn btn-primary float-right reg-next-button'>Next ></a>");

            $("#" + stepName + "Next").bind("click", function (e) {
                $("#" + stepName).hide();
                $("#step" + (i + 1)).show();
                if (i + 2 == count)
                    $(submitButtonName).show();
                selectStep(i + 1);
            });
        }

        function createSubmitButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<input class='btn btn-success float-right reg-submit-button' id='submit-button' name='commit' type='submit' value='Submit' style='display: block;'>");
        }

        function selectStep(i) {
            $("#steps li").removeClass("current-step");
            $("#stepDesc" + i).addClass("current-step");
        }
    };
})(jQuery);