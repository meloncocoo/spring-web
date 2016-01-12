<#import "/spring.ftl" as spring>
<form class="forget-form" action="javascript:void(0);" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<h3><@spring.message "account.forget.title" /></h3>
	<p><@spring.message "account.forget.tip" /></p>
	<div class="form-group">
		<div class="input-icon">
			<i class="fa fa-envelope"></i>
			<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"/>
		</div>
	</div>
	<div class="form-actions">
		<button type="button" class="btn" data-toggle="ajax" data-replace=".content" data-target="/account/login">
		<i class="m-icon-swapleft"></i> <@spring.message "button.back.label" /> </button>
		<button type="submit" class="btn green pull-right">
		<@spring.message "button.submit.label" /> <i class="m-icon-swapright m-icon-white"></i>
		</button>
	</div>
</form>
<script>
	$(document).ready(function() {
		$('[data-toggle="ajax"]').on('success.mln.ajax', function() {
			Melon.handleUniform();
		});
	});
</script>