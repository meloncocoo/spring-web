/**
 * 
 */
var Melon = function() {
	
	var assetsPath = '/';
	var globalImgPath = assetsPath + 'images/global/';
	
    var blockUI = function (options) {
        var options = $.extend(true, {}, options);
        var html = '';
        if (options.iconOnly) {
            html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '')+'"><img src="' + globalImgPath + 'loading-spinner-grey.gif" align=""></div>';
        } else if (options.textOnly) {
            html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '')+'"><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>';
        } else {    
            html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '')+'"><img src="' + globalImgPath + 'loading-spinner-grey.gif" align=""><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>';
        }

        if (options.target) { // element blocking
            var el = $(options.target);
            if (el.height() <= ($(window).height())) {
                options.cenrerY = true;
            }            
            el.block({
                message: html,
                baseZ: options.zIndex ? options.zIndex : 1000,
                centerY: options.cenrerY != undefined ? options.cenrerY : false,
                css: {
                    top: '10%',
                    border: '0',
                    padding: '0',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: options.overlayColor ? options.overlayColor : '#000',
                    opacity: options.boxed ? 0.05 : 0.1, 
                    cursor: 'wait'
                }
            });
        } else { // page blocking
            $.blockUI({
                message: html,
                baseZ: options.zIndex ? options.zIndex : 1000,
                css: {
                    border: '0',
                    padding: '0',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: options.overlayColor ? options.overlayColor : '#000',
                    opacity: options.boxed ? 0.05 : 0.1,
                    cursor: 'wait'
                }
            });
        }            
    };

    var unblockUI = function (target) {
        if (target) {
            $(target).unblock({
                onUnblock: function () {
                    $(target).css('position', '');
                    $(target).css('zoom', '');
                }
            });
        } else {
            $.unblockUI();
        }
    };
	
	// initializes main settings
	var handleInit = function() {
		$(document).ajaxStart ? $(document).ajaxStart(function() {
			blockUI()
		}).ajaxStop(function() {
			unblockUI(); 
		}) : null;
	};
	
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
	    	handleInit();
	    	handleUniform();
    	},
    	blockUI: function(options) {
    		blockUI(options);
    	},
    	unblockUI: function(options) {
    		unblockUI(unblockUI);
    	},
    	handleUniform: function() {
    		handleUniform();
    	}
    };
}();

+function($) {
	'use strict';

	var Ajax = function(element, options) {
		this.$element	= $(element);
		this.options 	= $.extend({}, Ajax.DEFAULTS, options);
		
		this.request();
	};
	
	Ajax.VERSION 				= '0.0.1';
	Ajax.DEFAULT_CONTENT_TYPE 	= 'application/x-www-form-urlencoded';
	Ajax.DEFAULT_METHOD			= 'GET';
	Ajax.DEFAULTS				= {
		contentType: 	Ajax.DEFAULT_CONTENT_TYPE,
		type:			Ajax.DEFAULT_METHOD
	};
	
	Ajax.prototype.request = function() {
		var options = this.options;
		var $target = $(this.options.target);
		$.get( options.url ).then(
			function(html) {
				$target.html(html);
				Melon.handleUniform();
			}, function(jqXHR, textStatus, errorThrown) {
				alert(textStatus);
			}
		);
	};

	function getOptionFromTrigger($trigger) {
		return $.extend({}, {
			url: 		$trigger.attr('data-url'),
			type: 		$trigger.attr('data-method'),
			target: 	$trigger.attr('data-target')
		});
	}

	function Plugin(option) {
		return this.each(function() {
			var $this   = $(this)
			var data	= $this.data('mln.ajax');
			var options = $.extend({}, Ajax.DEFAULTS, $this.data(), typeof option == 'object' && option)
			
			if (!data) $this.data('mln.ajax', (data = new Ajax(this, options)));
			if (typeof option == 'string') data[option].call($this);
		});
	}
	
	var old = $.fn.Ajax;
	
	$.fn.Ajax				= Plugin;
	$.fn.Ajax.Constructor	= Ajax;
	
	// AJAX NO CONFLICT
	// ==================

	$.fn.Ajax.noConflict = function () {
		$.fn.Ajax = old;
		return this;
	}

	// AJAX DATA-API
	// ===============

	$(document).on('click.mln.ajax.data-api', '[data-toggle="ajax"]', function(e) {
		var $this   = $(this)
		
		if (!$this.attr('data-target')) e.preventDefault();
		
	    var options = getOptionFromTrigger($this);

	    Plugin.call($this, options);
	});
}(jQuery);

jQuery(document).ready(function() {
	Melon.init();
});
