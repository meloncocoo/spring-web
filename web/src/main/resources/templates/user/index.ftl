<#import "/spring.ftl" as spring>
<#import "/libs/page.ftl" as page>
<@page.breadcrumb "user.allUsers" "page.list" />
<div class="row">
	<div class="col-md-12">
		<div class="table-scrollable">
			<table class="table table-condensed table-hover">
				<thead>
					<th><input type="checkbox" /></th>
					<th><@spring.message "user.fullName" /></th>
					<th><@spring.message "user.login" /></th>
					<th><@spring.message "user.email" /></th>
					<th class="text-center"><@spring.message "user.activated" /></th>
					<th class="text-center"><@spring.message "user.locked" /></th>
				</thead>
				<tbody>
				<#list users.content as user>
					<tr>
						<td><input type="checkbox" /></td>
						<td>${user.getFullName()}</td>
						<td>${user.getLogin()}</td>
						<td>${user.getEmail()}</td>
						<td class="text-center">${user.isActivated()?string('<span class="fa fa-check-circle"></span>', '<span class="fa fa-times-circle"></span>')}</td>
						<td class="text-center">${user.isLocked()?string('<span class="fa fa-check-circle"></span>', '<span class="fa fa-times-circle"></span>')}</td>
					<tr>
				</#list>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
if (typeof jQuery != 'undefined') {
	$(document).ready(function() {
		Melon.initUniform();
	});
}
</script>