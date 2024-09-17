<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>Aicraftmodelling</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>Aicraft modelling club</h1><hr>-->
<#--<#if user.email??>-->
<#--    <h3>Username: <i>${user.name}</i></h3>-->
<#--    <form action="/logout" method="post">-->
<#--        <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--        <input type="submit" value="Sign out"/>-->
<#--    </form>-->
<#--    <#if user.isAdmin()>-->
<#--        <a href="/admin">Admin pannel</a>-->
<#--    </#if>-->
<#--<#else> <a href="/login">Sign in</a></h1>-->
<#--</#if>-->
<#--<hr>-->
<#--<h4>Ptoducts</h4>-->
<#--<form action="/" method="get">-->
<#--    Search by title: <input type="text" name="title"><br>-->
<#--    <input type="submit" value="Search"/>-->
<#--</form>-->
<#--<#list products as product>-->
<#--    <div>-->
<#--        <p><b>${product.title}</b> ${product.price} | <a href="/product/${product.id}">Get more info...</a></p>-->
<#--    </div>-->
<#--    <#else>-->
<#--    <h3>The list of products is empty</h3>-->
<#--</#list>-->
<#--<#if user.email??>-->
<#--    <hr>-->
<#--    <h3>Create new product</h3>-->
<#--    <form action="/product/create" method="post" enctype="multipart/form-data">-->
<#--        Title: <input type="text" name="title"/><br><br>-->
<#--        Description: <input type="text" name="description"/><br><br>-->
<#--        Price: <input type="number" name="price"/><br><br>-->
<#--        First image: <input type="file" name="file1"/><br><br>-->
<#--        Second image: <input type="file" name="file2"/><br><br>-->
<#--        Third image: <input type="file" name="file3"/><br><br>-->
<#--        <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--        <input type="submit" value="Add product"/>-->
<#--    </form>-->
<#--</#if>-->
<#--</body>-->
<#--</html>-->

<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Search</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="searchWord">Search by title</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Search</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} $</p>
                        <form action="/product/add/${product.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success">Add to cart</button>
                        </form>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Not found</h1>
        </#list>
    </div>
</@t.template>
