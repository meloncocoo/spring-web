<#import "/spring.ftl" as spring>
<#import "/libs/page.ftl" as page>
<@page.breadcrumb "role.allRoles" "page.list" />
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