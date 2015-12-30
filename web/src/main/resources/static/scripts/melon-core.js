/**
 * 
 */
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

		options.success = function(html) {
			$(".content").html(html);
		};
		options.error = function() {
			alert("error");
		};

		$.ajax(options);	
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
			var data	= $this.data('mln.Ajax');
			var options = $.extend({}, Ajax.DEFAULTS, $this.data(), typeof option == 'object' && option)
			
			if (!data) $this.data('mln.Ajax', (data = new Ajax(this, options)));
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

	$(document).on('click.mln.Ajax.data-api', '[data-toggle="ajax"]', function(e) {
		var $this   = $(this)
		
		if (!$this.attr('data-target')) e.preventDefault();
		
	    var options = getOptionFromTrigger($this);

	    Plugin.call($this, options);
	});
}(jQuery);