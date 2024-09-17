<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">My Cart</h1>
    <hr>
    <div class="row">
        <#list cartItems as cartItem>
            <div class="col-md-8">
                <a href="/product/${cartItem.product.id}" class="product-link">
                    <div class="card text-white bg-dark my-3 product">
                        <img src="/images/${cartItem.product.previewImageId}"
                             class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">${cartItem.product.title}</h5>
                            <p class="card-text">${cartItem.product.price} $</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <form action="/cart/update/${cartItem.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <p>Quantity: </p>
                    <input type="number" name="quantity" value="${cartItem.quantity}" min="1" max="10">
                    <input type="submit" value="Update">
                </form>
                <form action="/cart/remove/${cartItem.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="submit" value="Remove">
                </form>
            </div>
        <#else>
            <h1 style="text-align: center">Your cart is empty</h1>
        </#list>
    </div>
</@t.template>