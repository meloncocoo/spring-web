<h2>Users</h2>

<table class="table table-bordered table-condensed">
	<thead>
		<th>Full Name</th>
		<th>User Name</th>
		<th>Email</th>
		<th>Activated</th>
		<th>Locked</th>
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