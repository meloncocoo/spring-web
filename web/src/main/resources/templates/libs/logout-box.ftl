<form class="hide" action="/logout" method="post" id="logout-form">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<a href="javascript:void(0);" onclick="document.getElementById('logout-form').submit();" class="btn btn-link btn-sm"><@spring.message "menu.root.logout.label" /></a></a>