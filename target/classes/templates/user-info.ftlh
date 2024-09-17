<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>Aicraftmodelling</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>Aicraftmodelling</h1><hr>-->
<#--<h3>Detailed information about the user ${user.name}</h3>-->
<#--<b>Phone number: </b> ${user.phoneNumber}<br>-->
<#--<b>Email: </b> ${user.email}<br>-->

<#--<h4>${user.name} user products</h4>-->
<#--<#list products as product>-->
<#--    <div>-->
<#--        <p><b>${product.title}</b> ${product.price} | <a href="/product/${product.id}">Get more info...</a></p>-->
<#--    </div>-->
<#--    <#else >-->
<#--    <h3>The list of products is empty</h3>-->
<#--</#list>-->
<#--<#if errorMessage??>-->
<#--    <h2 style="color: red">${errorMessage}</h2>-->
<#--</#if>-->
<#--</body>-->
<#--</html>-->
<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">Information about the user ${user.name}</h1>
    <hr>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Phone number: <b>${user.phoneNumber}</b>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">${user.name} user products</h1>
    <br>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} $</p>
                    </div>
                    <div class="card-footer">
                        ${product.user.name}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Not found</h1>
        </#list>
    </div>
</@t.template>