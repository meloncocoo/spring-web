/**
 * 
 */
var Melon = function() {
	
	// initializes main settings
	var handleInit = function() {
		
	};
	
    // Handles custom checkboxes & radios using jQuery Uniform plugin
    var handleUniform = function () {
        if (!$().uniform) {
            return;
        }
        var test = $("input[type=checkbox]:not(.toggle, .make-switch), input[type=radio]:not(.toggle, .star, .make-switch)");
        if (test.size() > 0) {
            test.each(function () {
                if ($(this).parents(".checker").size() == 0) {
                    $(this).show();
                    $(this).uniform();
                }
            });
        }
    };

    return {
    	init: function() {
	    	// Core handlers
	    	handleInit();
	    	handleUniform();
    	}
    };
}();
