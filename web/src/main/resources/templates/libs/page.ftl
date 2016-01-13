<#import "/spring.ftl" as spring>
<#macro breadcrumb title subTitle="">
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
		<@spring.message title /> <#if subTitle != ""><small><@spring.message subTitle /></small></#if>
		</h3>
		<ul class="page-breadcrumb breadcrumb">
			<li class="btn-group">
				<button href="javascript:;" class="btn blue"><i class="fa fa-refresh"></i> 刷新</button>
			</li>
			<li>
				<i class="fa fa-home"></i> <a href="/"> <@spring.message "menu.root.home.label" /> </a> <i class="fa fa-angle-right"></i>
			</li>
			<li><@spring.message title /></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
</#macro>

<#macro portlet title="" type="">
<div class="portlet ${type}">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i> ${title}
		</div>
		<div class="tools">
			<a href="javascript:;" class="reload"></a>
		</div>
	</div>
	<div class="portlet-body">
		<#nested>
	</div>
</div>
</#macro>