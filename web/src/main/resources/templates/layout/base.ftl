<#import "/libs/header.ftl" as header>

<#macro home title>
<#local site_name="Spring-Boot Example">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${title} - ${site_name}</title>
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel='stylesheet' href='/webjars/bootstrap/3.3.6/css/bootstrap.min.css' />
   	<link rel='stylesheet' href='/webjars/font-awesome/4.5.0/css/font-awesome.min.css' />
   	<link rel='stylesheet' href='/webjars/simple-line-icons/1.0.0/css/simple-line-icons.css' />
   	<link rel="stylesheet" href="/webjars/uniform/2.1.2/themes/default/css/uniform.default.min.css" />
   	<link rel="stylesheet" href="/css/components.css" />
   	<link rel="stylesheet" href="/css/plugins.css" />
   	<link rel="stylesheet" href="/css/layout.css" />
   	<link rel="stylesheet" href="/css/themes/default.css" />
   	<link rel="stylesheet" href="/css/main.css" />
</head>

<body class="page-header-fixed page-quick-sidebar-over-content page-full-width">
	<@header.navbar_fixed_top title />

	<div class="page-container">
		<div class="page-sidebar-wrapper">
			<div class="page-sidebar navbar-collapse collapse">
			<@header.topmenu 'class="page-sidebar-menu" data-slide-speed="200" data-auto-scroll="true"' />
			</div>
		</div>
		
		<div class="page-content-wrapper">
		    <div class="page-content">
		        <#nested>
		    </div>
	    </div>
    </div>
    
    <script src="/webjars/jquery/2.2.0/dist/jquery.min.js" type="text/javascript"></script>
	<script src="/webjars/easypie/2.1.6/dist/jquery.easypiechart.min.js" type="text/javascript"></script>
	<script src="/webjars/jquery.sparkline/2.1.2/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="/webjars/bootstrap/3.3.6/js/bootstrap.js" type="text/javascript"></script>
    <script src="/webjars/uniform/2.1.2/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="/webjars/jquery-blockui/2.65/jquery.blockUI.js" type="text/javascript"></script>
    <script src="/scripts/melon-core.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
		$('.change-language').on('success.mln.ajax', function() {
			window.location.reload();
		});
		$('[data-toggle="ajax"]').on('failure.mln.ajax', function(event, jqXHR, textStatus, errorThrown) {
			var result;
			try {result = $.parseJSON(jqXHR.responseText);} catch(e) {;}
			Melon.alert({
				type: 'danger',
                icon: 'warning',
                message: result ? result.message : errorThrown,
                //container: '.page-content',
                place: 'prepend'
			});
		});
		$('.easy-pie-chart .number.transactions').easyPieChart({
		    animate: 1000,
		    size: 75,
		    lineWidth: 3,
		    barColor: Melon.getBrandColor('yellow')
		});
		
		$('.easy-pie-chart .number.visits').easyPieChart({
		    animate: 1000,
		    size: 75,
		    lineWidth: 3,
		    barColor: Melon.getBrandColor('green')
		});
		
		$('.easy-pie-chart .number.bounce').easyPieChart({
		    animate: 1000,
		    size: 75,
		    lineWidth: 3,
		    barColor: Melon.getBrandColor('red')
		});
		$('.reload').click(function () {
            $('.easy-pie-chart .number').each(function () {
                var newValue = Math.floor(100 * Math.random());
                $(this).data('easyPieChart').update(newValue);
                $('span', this).text(newValue);
            });
        });
        $("#sparkline_bar").sparkline([8, 9, 10, 11, 10, 10, 12, 10, 10, 11, 9, 12, 11, 10, 9, 11, 13, 13, 12], {
            type: 'bar',
            width: '100',
            barWidth: 5,
            height: '55',
            barColor: '#35aa47',
            negBarColor: '#e02222'
        });

        $("#sparkline_bar2").sparkline([9, 11, 12, 13, 12, 13, 10, 14, 13, 11, 11, 12, 11, 11, 10, 12, 11, 10], {
            type: 'bar',
            width: '100',
            barWidth: 5,
            height: '55',
            barColor: '#ffb848',
            negBarColor: '#e02222'
        });

        $("#sparkline_line").sparkline([9, 10, 9, 10, 10, 11, 12, 10, 10, 11, 11, 12, 11, 10, 12, 11, 10, 12], {
            type: 'line',
            width: '100',
            height: '55',
            lineColor: '#ffb848'
        });
	});
	</script>    
</body>
</html>
</#macro>