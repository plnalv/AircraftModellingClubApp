<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>Aicraftmodelling</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>Aicraftmodelling</h1><hr>-->
<#--<h3>${user.name} user editing</h3>-->
<#--<form action="/admin/user/edit" method="post">-->
<#--    <#list roles as role>-->
<#--        <div>-->
<#--            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>-->
<#--        </div>-->
<#--    </#list>-->
<#--    <input type="hidden" value="${user.id}" name="userId">-->
<#--    <input type="hidden" value="${_csrf.token}" name="_csrf">-->
<#--    <button type="submit">Save</button>-->
<#--</form>-->
<#--</body>-->
<#--</html>-->
<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">${user.name} user editing</h1><hr>
    <form action="/admin/user/edit" method="post">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-dark">Save</button>
    </form>

</@t.template>