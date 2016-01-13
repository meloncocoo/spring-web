<#import "/spring.ftl" as spring>
<#import "/libs/page.ftl" as page>
<@page.breadcrumb "endPoints.all" "page.list" />
<div class="row">
	<div class="col-md-12">
		<div class="table-scrollable">
			<table class="table table-condensed table-hover">
				<thead>
					<tr>
						<th><@spring.message "endPoints.path" /></th>
						<th><@spring.message "endPoints.methods" /></th>
						<th><@spring.message "endPoints.consumes" /></th>
						<th><@spring.message "endPoints.produces" /></th>
						<th><@spring.message "endPoints.params" /></th>
						<th><@spring.message "endPoints.headers" /></th>
						<th><@spring.message "endPoints.custom" /></th>
					</tr>
				</thead>
				<tbody>
				<#list endPoints as endPoint>
					<tr>
						<td>${endPoint.patternsCondition}</td>
						<td>${endPoint.methodsCondition}</td>
						<td>${endPoint.consumesCondition}</td>
						<td>${endPoint.producesCondition}</td>
						<td>${endPoint.paramsCondition}</td>
						<td>${endPoint.headersCondition}</td>
						<td></td>
					</tr>
				</#list>
				</tbody>
			</table>
		</div>
	</div>
</div>