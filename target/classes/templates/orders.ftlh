<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Orders</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">№</th>
                <th scope="col">Order date</th>
                <th scope="col">User</th>
                <th scope="col">Items</th>
                <th scope="col">Total Price</th>
                <th scope="col">Delivery address</th>
                <th scope="col">Status</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <#list orders as order>
                <tr>
                    <th scope="row">${order.id}</th>
                    <td>${order.orderDate}</td>
                    <td>${order.user.email}</td>
                    <td>
                        <#list order.orderItems as item>
                            ${item.product.title} (Quantity: ${item.quantity})<br>
                        </#list>
                    </td>
                    <td>${order.totalPrice} $</td>
                    <td>
                        <#if order.address??>
                            ${order.address}
                        <#else>
                            Pickup
                        </#if>
                    </td>
                    <#list order.orderItems as orderItem>
                        <td>

                            <#if orderItem.status == "NEW">
                                New
                            <#elseif orderItem.status == "IN_PROGRESS">
                                In Progress
                            <#elseif orderItem.status == "SHIPPED">
                                Shipped
                            <#elseif orderItem.status == "DELIVERED">
                                Delivered
                            <#elseif orderItem.status == "REFUNDED">
                                Refunded
                            </#if>
                        </td>
                        <td>
                            <#if orderItem.status == "NEW">
                                <form action="/orderItem/update-status" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <input type="hidden" name="orderItemId" value="${orderItem.id}">
                                    <input type="hidden" name="status" value="IN_PROGRESS">
                                    <button type="submit" class="btn btn-primary">Mark as In Progress</button>
                                </form>
                            <#elseif orderItem.status == "IN_PROGRESS">
                                <form action="/orderItem/update-status" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <input type="hidden" name="orderItemId" value="${orderItem.id}">
                                    <input type="hidden" name="status" value="SHIPPED">
                                    <button type="submit" class="btn btn-primary">Mark as Shipped</button>
                                </form>
                            <#elseif orderItem.status == "SHIPPED">
                                <form action="/orderItem/update-status" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <input type="hidden" name="orderItemId" value="${orderItem.id}">
                                    <input type="hidden" name="status" value="DELIVERED">
                                    <button type="submit" class="btn btn-primary">Mark as Delivered</button>
                                </form>
                            <#elseif orderItem.status == "DELIVERED">
                                <form action="/orderItem/update-status" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <input type="hidden" name="orderItemId" value="${orderItem.id}">
                                    <input type="hidden" name="status" value="REFUNDED">
                                    <button type="submit" class="btn btn-primary">Mark as Refunded</button>
                                </form>
                            </#if>
                        </td>
                    </#list>

                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</@t.template>
