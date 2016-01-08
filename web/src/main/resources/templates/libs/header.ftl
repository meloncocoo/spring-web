<#import "/spring.ftl" as spring>
<#macro navbar_fixed_top title>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="padding-top: 9px" href="/">
                <img alt="${title}" src="/images/logo.png" height="32">
            </a>
            <a class="navbar-brand " href="/"><@spring.message "menu.root.home.label" /></a>
            <ul class="nav navbar-nav">
                <li><a href="javascript:void(0);" data-toggle="ajax" data-target="body > .container" data-url="/user"><@spring.message "menu.root.users.label" /></a></li>
                <li><a href="/admin"><@spring.message "menu.root.admin.label" /></a></li>
            </ul>
        </div>
        <div class="navbar-right" style="margin: 10px 4px">
        	<#include '/libs/logout-box.ftl'>
        	<a class="change-language" href="javascript:void(0);" data-toggle="ajax" data-url="/api/language?lang=zh_CN"><@spring.message "menu.root.chinese.label" /></a> | 
        	<a class="change-language" href="javascript:void(0);" data-toggle="ajax" data-url="/api/language?lang=en"><@spring.message "menu.root.english.label" /></a>
        </div>
    </div>
</nav>
</#macro>