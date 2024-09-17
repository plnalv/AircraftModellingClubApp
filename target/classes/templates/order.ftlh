<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Order</h1>
    <hr>
    <div class="row">
        <div class="col-md-8">
            <form action="/order" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <h3>1. Specify the recipient</h3>
                <div class="form-group">
                    <label for="name">Name*</label>
                    <input type="text" class="form-control" id="name" name="name"
                           value="${user.name}" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number*</label>
                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber"
                           value="${user.phoneNumber}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email*</label>
                    <input type="email" class="form-control" id="email" name="email"
                           value="${user.email}" required>
                </div>
                <br>
                <h3>2. Select a delivery method</h3>
                <div class="form-group">
                    <select class="form-control" id="deliveryMethod" name="deliveryMethod" required>
                        <option value="pickup">Pickup</option>
                        <option value="delivery">Delivery</option>
                    </select>
                </div>
                <div id="pickupAddress">
                    <p>Address: [store address]</p>
                </div>
                <div id="deliveryAddress" style="display: none;">
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" class="form-control" id="city" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="street">Street:</label>
                        <input type="text" class="form-control" id="street" name="street" required>
                    </div>
                    <div class="form-group">
                        <label for="house">House:</label>
                        <input type="text" class="form-control" id="house" name="house" required>
                    </div>
                </div>
                <br>
                <h3>3. Select a payment method</h3>
                <div class="form-group">
                    <select class="form-control" id="payment" name="payment" required>
                        <option value="cash">Cash</option>
                        <option value="card">Card via terminal</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Place an order</button>
            </form>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Order Summary</h5>
                    <p class="card-text">
                        Items: ${cart.totalQuantity}
                    </p>
                    <p class="card-text">
                        Price: ${cart.totalPrice} $
                    </p>
                </div>
            </div>
        </div>
    </div>
    <script>
        const deliveryMethodSelect = document.getElementById('deliveryMethod');
        const pickupAddress = document.getElementById('pickupAddress');
        const deliveryAddress = document.getElementById('deliveryAddress');

        deliveryMethodSelect.addEventListener('change', () => {
            if (deliveryMethodSelect.value === 'pickup') {
                pickupAddress.style.display = 'block';
                deliveryAddress.style.display = 'none';
            } else if (deliveryMethodSelect.value === 'delivery') {
                pickupAddress.style.display = 'none';
                deliveryAddress.style.display = 'block';
            }
        });
    </script>
</@t.template>