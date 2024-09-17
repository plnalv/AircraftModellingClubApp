<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Personal account</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Email: <b>${user.email}</b>
        <br>
        Phone number: <b>${user.phoneNumber}</b>
        <br>
        <br>
        <#if user.isAdmin()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/admin">
                Admin pannel
            </a><br>
        </#if>
        <#if user.isAdmin()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/admin/competitions">
                Competitions
            </a><br>
        </#if>
        <#if user.isSeller()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/my/products">
                My products
            </a>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/orders">
                Orders
            </a><br>
        </#if>
        <#if user.isUser()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/cart">
                My cart
            </a>
        </#if>
        <#if user.isUser()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/my/competitions">
                My competitions
            </a>
        </#if>
        <#if user.isUser()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/deliveries">
                My deliveries
            </a>
        </#if>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="text-align: center; width: 100%" class="btn btn-danger mb-2">
                Sign out
            </button>
        </form>
    </div>
</@t.template>