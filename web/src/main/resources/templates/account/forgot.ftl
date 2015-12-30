<form class="forget-form" action="javascript:void(0);" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<h3>Forget Password ?</h3>
	<p>
		 Enter your e-mail address below to reset your password.
	</p>
	<div class="form-group">
		<div class="input-icon">
			<i class="fa fa-envelope"></i>
			<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"/>
		</div>
	</div>
	<div class="form-actions">
		<button type="button" class="btn" data-toggle="ajax" data-target=".content" data-url="/account/login">
		<i class="m-icon-swapleft"></i> Back </button>
		<button type="submit" class="btn green pull-right">
		Submit <i class="m-icon-swapright m-icon-white"></i>
		</button>
	</div>
</form>
