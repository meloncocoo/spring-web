<form class="login-form" action="/account/login" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<h3 class="form-title">Login to your account</h3>
	<#if error??>
	<div class="alert alert-danger">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<span>${msg}</span>
	</div>
	</#if>
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
			 no worries, click <a href="javascript:void(0);" data-toggle="ajax" data-target=".content" data-url="/account/forgot">
			here </a>
			to reset your password.
		</p>
	</div>
</form>
