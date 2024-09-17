<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Delivery</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <#if orders?size == 0>
            <p>No actual deliveries</p>
        <#else>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Product</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>
                <tbody>
                <#list orders as order>
                    <#list order.orderItems as item>
                        <tr>
                            <th scope="row">${order.id}</th>
                            <td>${item.product.title}</td>
                            <td>
                                <#if item.status == "NEW">
                                    New
                                <#elseif item.status == "IN_PROGRESS">
                                    In Progress
                                <#elseif item.status == "SHIPPED">
                                    Shipped
                                <#elseif item.status == "DELIVERED">
                                    Delivered
                                <#elseif item.status == "REFUNDED">
                                    Refunded
                                </#if>
                            </td>
                        </tr>
                    </#list>
                </#list>
                </tbody>
            </table>
        </#if>
    </div>
</@t.template>