<#import "/spring.ftl" as spring>
<#macro breadcrumb title subTitle>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
		<@spring.message title /> <small><@spring.message subTitle /></small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">
			<li class="btn-group">
				<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
				<span>
				Actions </span>
				<i class="fa fa-angle-down"></i>
				</button>
				<ul class="dropdown-menu pull-right" role="menu">
					<li>
						<a href="#">
						Action </a>
					</li>
					<li>
						<a href="#">
						Another action </a>
					</li>
					<li>
						<a href="#">
						Something else here </a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">
						Separated link </a>
					</li>
				</ul>
			</li>
			<li>
				<i class="fa fa-home"></i>
				<a href="#">
				Home </a>
				<i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="#">
				Page Layouts </a>
				<i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="#">
				Horizontal Mega Menu 1 </a>
			</li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
</#macro>