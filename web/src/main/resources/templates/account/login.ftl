<#import "/spring.ftl" as spring>
<form class="login-form" action="/login" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<h3 class="form-title"><@spring.message "account.login.title" /></h3>
	<#if error??>
	<div class="alert alert-danger">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<span>${msg}</span>
	</div>
	<#elseif msg??>
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<span>${msg}</span>
	</div>
	</#if>
	<div class="form-group">
		<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
		<label class="control-label visible-ie8 visible-ie9"><@spring.message "user.username" /></label>
		<div class="input-icon">
			<i class="fa fa-user"></i>
			<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="<@spring.message "user.username" />" name="username"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label visible-ie8 visible-ie9"><@spring.message "user.password" /></label>
		<div class="input-icon">
			<i class="fa fa-lock"></i>
			<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="<@spring.message "user.password" />" name="password"/>
		</div>
	</div>
	<div class="form-actions">
		<label class="checkbox">
		<input type="checkbox" name="remember" value="1"/> <@spring.message "user.rememberMe" /> </label>
		<button type="submit" class="btn green pull-right">
		<@spring.message "button.login.label" /> <i class="m-icon-swapright m-icon-white"></i>
		</button>
	</div>
	<div class="forget-password">
		<h4><@spring.message "account.forget.label" /></h4>
		<p>
			 no worries, click <a href="/account/forgot" data-toggle="ajax" data-replace=".content">
			here </a>
			to reset your password.
		</p>
	</div>
</form>
<script>
if (typeof jQuery != 'undefined') {
	$(document).ready(function() {
		Melon.initUniform();
	});
}
</script>    