package by.aliyeva.aircraftmodellingclub.services;

import by.aliyeva.aircraftmodellingclub.models.*;
import by.aliyeva.aircraftmodellingclub.repositories.OrderItemRepository;
import by.aliyeva.aircraftmodellingclub.repositories.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;

    public Order createOrderFromCart(
            Cart cart,
            String deliveryMethod,
            String city,
            String street,
            String house,
            String paymentMethod
    ) {
        Order order = new Order();
        order.setUser(cart.getUser());
        order.setOrderDate(new Date());

        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem cartItem : cart.getItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setStatus("NEW");
            orderItem.setOrder(order);
            orderItem.setSeller(cartItem.getProduct().getUser());
            orderItems.add(orderItem);
        }
        order.setOrderItems(orderItems);
        order.setTotalPrice(cart.getTotalPrice());
        order.setDeliveryMethod(deliveryMethod);
        if (deliveryMethod.equals("pickup")) {
            order.setAddress(null);
        } else {
            order.setAddress(city + ", " + street + ", " + house);
        }
        order.setPaymentMethod(paymentMethod);
        return orderRepository.save(order);
    }

    public List<Order> getOrdersBySeller(User seller) {
        return orderRepository.findByOrderItemsProductUser(seller);
    }

    public void updateOrderItemStatus(Long orderId, Long orderItemId, String status) {
        OrderItem orderItem = orderItemRepository.findById(orderItemId).orElseThrow();
        orderItem.setStatus(status);
        orderItemRepository.save(orderItem);
    }

    public List<Order> getOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }

}
