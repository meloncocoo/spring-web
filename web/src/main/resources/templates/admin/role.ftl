<#import "/spring.ftl" as spring>
<#import "/libs/page.ftl" as page>
<@page.breadcrumb "role.allRoles" "page.list" />
<div class="table-scrollable">
	<table class="table table-striped table-hover">
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
</div>