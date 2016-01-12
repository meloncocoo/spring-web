<#import "/spring.ftl" as spring>
<h3><@spring.message "role.allRoles" /></h3>
<table class="table table-bordered table-condensed">
	<thead>
		<th><@spring.message "role.name" /></th>
	</thead>
	<tbody>
	<#list roles.content as role>
		<tr>
			<td>${role.getName()}</td>
		<tr>
	</#list>
	</tbody>
</table>