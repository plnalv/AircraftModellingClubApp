<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">My Cart</h1>
    <hr>
    <div class="row">
        <div class="col-md-8">
            <#list cartItems as cartItem>
                <div class="card mb-3">
                    <div class="row no-gutters">
                        <a href="/product/${cartItem.product.id}" class="product-link">
                            <div class="col-md-4">
                                <img src="/images/${cartItem.product.previewImageId}" class="card-img" alt="${cartItem.product.title}">
                            </div>
                        </a>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><a href="/product/${cartItem.product.id}" class="product-link">${cartItem.product.title}</a></h5>
                                <p class="card-text">${cartItem.product.price} $</p>
                                <form action="/cart/update/${cartItem.id}" method="post">
                                    <p>Quantity: </p>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="number" name="quantity" value="${cartItem.quantity}" min="1" max="10" class="form-control"><br>
                                    <input type="submit" value="Update" class="btn btn-primary">
                                </form><br>
                                <form action="/cart/remove/${cartItem.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="submit" value="Remove" class="btn btn-danger">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            <#else>
                <h1 style="text-align: center">Your cart is empty</h1>
            </#list>
        </div>
        <#if cartItems?has_content>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total</h5>
                        <p class="card-text">
                            Items: ${cart.totalQuantity}
                        </p>
                        <p class="card-text">
                            Price: ${cart.totalPrice} $
                        </p>
                        <a href="/order" class="btn btn-primary">Checkout</a>
                    </div>
                </div>
            </div>
        </#if>
    </div>
</@t.template>
