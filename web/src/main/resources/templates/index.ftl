<#import "/layout/base.ftl" as base>
<@base.home title="Index">
<#import "/libs/page.ftl" as page>
<@page.breadcrumb "page.home" />

<div class="row">
	<div class="col-md-6">
	<@page.portlet type="">
		<div class="row">
			<div class="col-md-4">
				<div class="easy-pie-chart">
					<div class="number transactions" data-percent="55">
						<span>
						+55 </span>
						%
					</div>
					<a class="title" href="#">
					Transactions <i class="icon-arrow-right"></i>
					</a>
				</div>
			</div>
			<div class="margin-bottom-10 visible-sm">
			</div>
			<div class="col-md-4">
				<div class="easy-pie-chart">
					<div class="number visits" data-percent="85">
						<span>
						+85 </span>
						%
					</div>
					<a class="title" href="#">
					New Visits <i class="icon-arrow-right"></i>
					</a>
				</div>
			</div>
			<div class="margin-bottom-10 visible-sm">
			</div>
			<div class="col-md-4">
				<div class="easy-pie-chart">
					<div class="number bounce" data-percent="46">
						<span>
						-46 </span>
						%
					</div>
					<a class="title" href="#">
					Bounce <i class="icon-arrow-right"></i>
					</a>
				</div>
			</div>
		</div>
	</@page.portlet>
	</div>
	
	<div class="col-md-6">
	<@page.portlet type="">
		<div class="row">
			<div class="col-md-4">
				<div class="sparkline-chart">
					<div class="number" id="sparkline_bar">
					</div>
					<a class="title" href="#">
					Network <i class="icon-arrow-right"></i>
					</a>
				</div>
			</div>
			<div class="margin-bottom-10 visible-sm">
			</div>
			<div class="col-md-4">
				<div class="sparkline-chart">
					<div class="number" id="sparkline_bar2">
					</div>
					<a class="title" href="#">
					CPU Load <i class="icon-arrow-right"></i>
					</a>
				</div>
			</div>
			<div class="margin-bottom-10 visible-sm">
			</div>
			<div class="col-md-4">
				<div class="sparkline-chart">
					<div class="number" id="sparkline_line">
					</div>
					<a class="title" href="#">
					Load Rate <i class="icon-arrow-right"></i>
					</a>
				</div>
			</div>
		</div>
	
	</@>
	</div>
</div>
</@base.home>