<#macro login title>
<#local site_name="Spring-Boot Example">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${title} - ${site_name}</title>
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel='stylesheet' href='/webjars/bootstrap/3.3.6/css/bootstrap.min.css' />
   	<link rel='stylesheet' href='/webjars/font-awesome/4.5.0/css/font-awesome.min.css' />
   	<link rel="stylesheet" href="/css/login.css" />
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	    <div class="container-fluid">
	        <div class="navbar-header">
	            <a class="navbar-brand" style="padding-top: 9px" href="/">
	                <img alt="${title}" src="/images/logo.png" height="32">
	            </a>
	            <a class="navbar-brand " href="/">Home</a>
	            <ul class="nav navbar-nav">
	                <li class="active"><a href="/">Documentation</a></li>
	                <li><a href="/">NPM WebJars</a></li>
	                <li><a href="/">Bower WebJars</a></li>
	                <li><a href="/">Classic WebJars</a></li>
	                <li><a href="/admin">Administrator</a></li>
	            </ul>
	        </div>
	        <p class="navbar-text navbar-right" style="margin-right: 4px">Sponsored by <a href="http://www.meloncocoo.com" class="navbar-link">MelonCocoo</a></p>
	    </div>
	</nav>

    <div class="container">
        <#nested>
    </div>
    
    <script src="/webjars/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
</#macro>