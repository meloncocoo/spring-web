<#import "/spring.ftl" as spring>
<#import "/libs/page.ftl" as page>
<@page.breadcrumb "role.allRoles" "page.list" />
<div class="row">
	<div class="col-md-12">
		<div class="table-scrollable">
			<table class="table table-condensed table-hover">
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
	</div>
</div>