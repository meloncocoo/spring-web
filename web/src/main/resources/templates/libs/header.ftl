<#import "/spring.ftl" as spring>
<#macro navbar_fixed_top title>
<nav class="page-header navbar navbar-fixed-top">
    <div class="page-header-inner">
    	<div class="page-logo">
            <a class="navbar-brand" style="padding-top: 6px" href="/">
                <img alt="${title}" src="/images/logo.png" height="32">
            </a>
    	</div>
    	<div class="hor-menu hor-menu-light hidden-sm hidden-xs">
			<ul class="nav navbar-nav">
				<li class="classic-menu-dropdown active">
					<a href="/">
					<i class="fa fa-home"></i> <@spring.message "menu.root.home.label" /> <span class="selected"></span>
					</a>
				</li>
                <li><a href="/user" data-toggle="ajax" data-replace=".page-content"><i class="fa fa-user"></i> <@spring.message "menu.root.users.label" /></a></li>
                <li><a href="/admin/role" data-toggle="ajax" data-replace=".page-content"><i class="fa fa-lock"></i> <@spring.message "menu.root.roles.label" /></a></li>
			</ul>
		</div>
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<li>
					<a class="change-language" href="/api/language?lang=zh_CN" data-toggle="ajax"><@spring.message "menu.root.chinese.label" /></a> 
				</li>	
				<li>
        			<a class="change-language" href="/api/language?lang=en" data-toggle="ajax"><@spring.message "menu.root.english.label" /></a>
				</li>				
				<li class="">
					<#include '/libs/logout-box.ftl'>
				</li>
			</ul>
		</div>
        <!--div class="navbar-right" style="margin: 10px 4px">
        	<#include '/libs/logout-box.ftl'>
        	<a class="change-language" href="/api/language?lang=zh_CN" data-toggle="ajax"><@spring.message "menu.root.chinese.label" /></a> | 
        	<a class="change-language" href="/api/language?lang=en" data-toggle="ajax"><@spring.message "menu.root.english.label" /></a>
        </div-->
    </div>
</nav>
<div class="clearfix"></div>
</#macro>