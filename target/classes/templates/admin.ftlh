<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>Aicraftmodelling</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>Aicraft modelling club</h1><hr>-->
<#--<h4>Admin pannel</h4>-->
<#--<table border="1">-->
<#--    <tr>-->
<#--        <th>Email</th>-->
<#--        <th>Phone number</th>-->
<#--        <th>Activity</th>-->
<#--        <th>Roles</th>-->
<#--        <th>Ban</th>-->
<#--        <th>Delete</th>-->
<#--        <th>Editing</th>-->
<#--        <th>Detailed info</th>-->
<#--    </tr>-->
<#--    <#list users as user>-->
<#--        <tr>-->
<#--            <th>${user.email}</th>-->
<#--            <th>${user.phoneNumber}</th>-->
<#--            <th><#if user.active>true<#else>false</#if></th>-->
<#--            <th>-->
<#--                <#list user.roles as role>${role}</#list>-->
<#--            </th>-->
<#--            <th>-->
<#--                <form action="/admin/user/ban/${user.id}" method="post">-->
<#--                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                    <input type="submit" value="Ban">-->
<#--                </form>-->
<#--            </th>-->
<#--            <th>-->
<#--                <form action="/admin/user/delete/${user.id}" method="post">-->
<#--                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                    <input type="submit" value="Delete">-->
<#--                </form>-->
<#--            </th>-->
<#--            <th><a href="/admin/user/edit/${user.id}">Editing</a></th>-->
<#--            <th><a href="/user/${user.id}">Detailed info</a></th>-->
<#--        </tr>-->
<#--        <#else >-->
<#--        <h3>The list of users is empty</h3>-->
<#--    </#list>-->
<#--</table>-->
<#--</body>-->
<#--</html>-->

<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Admin pannel</h1><hr>
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Email</th>
            <th scope="col">Phone number</th>
            <th scope="col">Activity</th>
            <th scope="col">Role</th>
            <th scope="col">Ban</th>
            <th scope="col">Edit</th>
            <th scope="col">Detailed info</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Ban">
                    </form>
                </th>
                <th><a href="/admin/user/edit/${user.id}">Edit</a></th>
                <th><a href="/user/${user.id}">Detailed info</a></th>
            </tr>
        <#else>
            <h3>The list of the users is empty</h3>
        </#list>
    </table>
</@t.template>
