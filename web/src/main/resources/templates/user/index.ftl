<#import "/spring.ftl" as spring>
<h3><@spring.message "user.allUsers" /></h3>

<table class="table table-bordered table-condensed">
	<thead>
		<th><@spring.message "user.fullName" /></th>
		<th><@spring.message "user.login" /></th>
		<th><@spring.message "user.email" /></th>
		<th><@spring.message "user.activated" /></th>
		<th><@spring.message "user.locked" /></th>
	</thead>
	<tbody>
	<#list users.content as user>
		<tr>
			<td>${user.getFullName()}</td>
			<td>${user.getLogin()}</td>
			<td>${user.getEmail()}</td>
			<td>${user.isActivated()?string('yes', 'no')}</td>
			<td>${user.isLocked()?string('yes', 'no')}</td>
		<tr>
	</#list>
	</tbody>
</table>