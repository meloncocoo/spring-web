/**
 * 
 */
var Melon = function() {
	
	var assetsPath = '/';
	var globalImgPath = assetsPath + 'images/global/';
	var brandColors = {
	        'blue': '#89C4F4',
	        'red': '#F3565D',
	        'green': '#1bbc9b',
	        'purple': '#9b59b6',
	        'grey': '#95a5a6',
	        'yellow': '#F8CB00'
	    };
	
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
		}).ajaxError(function(event, request, settings) {
//			alert(request.status);
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
    
    var handleHorMenu = function () {
    	var test = $(".hor-menu > UL.nav.navbar-nav > li, .top-menu > UL.nav.navbar-nav > li");
    	test.on("click", function() {
    		test.removeClass("active");
    		test.find("span.selected").remove();
    		$(this).addClass("active");
    		$(this).append("<span class='selected'></span>");
    	});
    }

    return {
    	init: function() {
	    	handleInit();
	    	handleUniform();
	    	handleHorMenu();
    	},
    	blockUI: function(options) {
    		blockUI(options);
    	},
    	unblockUI: function(options) {
    		unblockUI(unblockUI);
    	},
    	getUniqueID: function(prefix) {
            return 'prefix_' + Math.floor(Math.random() * (new Date()).getTime());
        },
        alert: function(options) {

            options = $.extend(true, {
                container: "", // alerts parent container(by default placed after the page breadcrumbs)
                place: "append", // append or prepent in container 
                type: 'success',  // alert's type
                message: "",  // alert's message
                close: true, // make alert closable
                reset: true, // close all previouse alerts first
                focus: true, // auto scroll to the alert after shown
                closeInSeconds: 0, // auto close after defined seconds
                icon: "" // put icon before the message
            }, options);

            var id = Melon.getUniqueID("Melon_alert");

            var html = '<div id="'+id+'" class="Melon-alerts alert alert-'+options.type+' fade in">' + (options.close ? '<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>' : '' ) + (options.icon != "" ? '<i class="fa-lg fa fa-'+options.icon + '"></i>  ' : '') + options.message+'</div>'

            if (options.reset) {0
                $('.Melon-alerts').remove();
            }

            if (!options.container) {
                $('.page-breadcrumb').after(html);
            } else {
                if (options.place == "append") {
                    $(options.container).append(html);
                } else {
                    $(options.container).prepend(html);
                }
            }
//
//            if (options.focus) {
//                Melon.scrollTo($('#' + id));
//            }

            if (options.closeInSeconds > 0) {
                setTimeout(function(){
                    $('#' + id).remove();
                }, options.closeInSeconds * 1000);
            }
        },

        // initializes uniform elements
        initUniform: function (els) {
            if (els) {
                $(els).each(function () {
                    if ($(this).parents(".checker").size() == 0) {
                        $(this).show();
                        $(this).uniform();
                    }
                });
            } else {
                handleUniform();
            }
        },
        
        getBrandColor: function (name) {
            if (brandColors[name]) {
                return brandColors[name];
            } else {
                return '';
            }
        }
    };
}();

/* ========================================================================
 * Melon-jQuery: Ajax.js v1.0.1
 * http://www.meloncocoo.com
 * ========================================================================
 * Copyright 2015-2016 Melon, Inc.
 * Licensed under MIT (https://github.com/meloncocoo/melon-jquery/master/LICENSE)
 * ======================================================================== */

+function($) {
	'use strict';

	var Ajax = function(element, options) {
		this.element	= $(element);
		this.options 	= $.extend({}, Ajax.DEFAULTS, options);
	};
	
	Ajax.VERSION 				= '1.0.1';
	Ajax.DEFAULT_CONTENT_TYPE 	= 'application/x-www-form-urlencoded';
	Ajax.DEFAULT_METHOD			= 'GET';
	Ajax.DEFAULTS				= {
		contentType: 	Ajax.DEFAULT_CONTENT_TYPE,
		type:			Ajax.DEFAULT_METHOD
	};
	
	Ajax.prototype.request = function() {
		var options 	= this.options;
		var $this		= this.element;
		var href, url	= $this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '');
		var successEvent = $.Event('success.mln.ajax', {
			relatedTarget: $this[0]
		});
		var failureEvent = $.Event('failure.mln.ajax', {
			relatedTarget: $this[0]
		});
		$.get(url).then(
			function(html) {
				var $target = $($this.attr('data-replace'));
				if ($target) $target.html(html);
				$this.trigger(successEvent);
			}, function(jqXHR, textStatus, errorThrown) {
				$this.trigger(failureEvent, [jqXHR, textStatus, errorThrown]);
			}
		);
	};

	function Plugin(option) {
		return this.each(function() {
			var $this   = $(this)
			var data	= $this.data('mln.ajax');
			var options = typeof option == 'object' && option;
			
			if (!data) $this.data('mln.ajax', (data = new Ajax(this, options)));
			if (typeof option == 'string') data[option].call(data);
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
	    Plugin.call($this, 'request');
	});
}(jQuery);

jQuery(document).ready(function() {
	Melon.init();
});
