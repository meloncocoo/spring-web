<#import "/spring.ftl" as spring>
<form class="hide" action="/logout" method="post" id="logout-form">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<a href="javascript:;" onclick="document.getElementById('logout-form').submit();" class="dropdown-toggle" title="<@spring.message "menu.root.logout.label" />"><i class="icon-logout"></i></a>