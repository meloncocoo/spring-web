<#import "/layout/account.ftl" as account>
<@account.login title="Sign In">
<!--form name="login" aciton="/login" method="POST">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<fieldset>
		<label for="username">Username</lable>
		<input type="text" id="username" name="username" />
		<label for="password">Password</label>
		<input type="password" id="password" name="password" />
		
		<button type="submit" class="btn">Log in</button>
	</fieldset>
</form-->
<form class="login-form" action="http://www.keenthemes.com/preview/metronic/templates/admin/index.html" method="post">
	<h3 class="form-title">Login to your account</h3>
	<div class="alert alert-danger display-hide">
		<button class="close" data-close="alert"></button>
		<span>
		Enter any username and password. </span>
	</div>
	<div class="form-group">
		<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
		<label class="control-label visible-ie8 visible-ie9">Username</label>
		<div class="input-icon">
			<i class="fa fa-user"></i>
			<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label visible-ie8 visible-ie9">Password</label>
		<div class="input-icon">
			<i class="fa fa-lock"></i>
			<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password"/>
		</div>
	</div>
	<div class="form-actions">
		<label class="checkbox">
		<input type="checkbox" name="remember" value="1"/> Remember me </label>
		<button type="submit" class="btn green pull-right">
		Login <i class="m-icon-swapright m-icon-white"></i>
		</button>
	</div>
	<div class="forget-password">
		<h4>Forgot your password ?</h4>
		<p>
			 no worries, click <a href="javascript:;" id="forget-password">
			here </a>
			to reset your password.
		</p>
	</div>
</form>
</@account.login>