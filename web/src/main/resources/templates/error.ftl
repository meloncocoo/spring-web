<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Error</title>
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel='stylesheet' href='/webjars/bootstrap/3.3.6/css/bootstrap.min.css' />
   	<link rel="stylesheet" href="/css/components.css" />
   	<link rel="stylesheet" href="/css/error.css" />
</head>

<body class="error-page-full-page">
<div class="row">
	<div class="col-md-12 error-page">
		<div class="number">
			 ${status}
		</div>
		<div class="details">
			<h3>Oops! ${error}</h3>
			<p>
				${path} - ${message}.<br/>
				<a href="/"> Return home </a>.
			</p>
		</div>
	</div>
</div>
</body>
</html>
