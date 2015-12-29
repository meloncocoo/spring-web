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
   	<link rel="stylesheet" href="/webjars/uniform/2.1.2/themes/default/css/uniform.default.min.css" />
   	<link rel="stylesheet" href="/css/components.css" />
   	<link rel="stylesheet" href="/css/login.css" />
</head>

<body class="login">

	<div class="logo">
		<a href="index-2.html">
		<img src="/images/logo.png" alt="">
		</a>
	</div>

    <div class="content">
        <#nested>
    </div>
    
    <script src="/webjars/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/webjars/uniform/2.1.2/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="/scripts/melon.js" type="text/javascript"></script>
    
    <script>
    	jQuery(document).ready(function() {
    		Melon.init();
    	});
    </script>
</body>
</html>
</#macro>