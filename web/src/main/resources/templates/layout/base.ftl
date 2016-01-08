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
   	<link rel="stylesheet" href="/webjars/uniform/2.1.2/themes/default/css/uniform.default.min.css" />
   	<link rel="stylesheet" href="/css/components.css" />
   	<link rel="stylesheet" href="/css/main.css" />
</head>

<body>
	<@header.navbar_fixed_top title />

	<div class="jumbotron">
	    <div class="container">
	        <#nested>
	    </div>
    </div>
    <div class="container"></div>
    
    <script src="/webjars/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="/webjars/bootstrap/3.3.6/js/bootstrap.js" type="text/javascript"></script>
    <script src="/webjars/uniform/2.1.2/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="/webjars/jquery-blockui/2.65/jquery.blockUI.js" type="text/javascript"></script>
    <script src="/scripts/melon-core.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
		$('.change-language').on('success.mln.ajax', function() {
			window.location.reload();
		});
	});
	</script>    
</body>
</html>
</#macro>

<#macro admin title>
<#local site_name="Spring-Boot Administrator">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${title} - ${site_name}</title>
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel='stylesheet' href='/webjars/bootstrap/3.3.6/css/bootstrap.min.css' />
   	<link rel='stylesheet' href='/webjars/font-awesome/4.5.0/css/font-awesome.min.css' />
   	<link rel="stylesheet" href="/css/components.css" />
   	<link rel="stylesheet" href="/css/main.css" />
</head>

<body>
	<@header.navbar_fixed_top title />

	<div class="jumbotron">
	    <div class="container">
	        <#nested>
	    </div>
    </div>
    <div class="container"></div>
    
    <script src="/webjars/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/scripts/melon-core.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
		$('.change-language').on('success.mln.ajax', function() {
			window.location.reload();
		});
	});
	</script>    
</body>
</html>
</#macro>