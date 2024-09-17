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
