package by.aliyeva.aircraftmodellingclub.controllers;

import by.aliyeva.aircraftmodellingclub.models.Cart;
import by.aliyeva.aircraftmodellingclub.models.Order;
import by.aliyeva.aircraftmodellingclub.models.User;
import by.aliyeva.aircraftmodellingclub.services.CartService;
import by.aliyeva.aircraftmodellingclub.services.OrderService;
import by.aliyeva.aircraftmodellingclub.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final UserService userService;
    private final CartService cartService;
    private final OrderService orderService;

    @GetMapping("/orders")
    public String orders(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        if (!user.isSeller()) {
            return "redirect:/";
        }
        List<Order> orders = orderService.getOrdersBySeller(user);
        model.addAttribute("user", user);
        model.addAttribute("orders", orders);
        return "orders";
    }

    @GetMapping("/order/confirmation")
    public String orderConfirmation(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "order-confirmation";
    }

    @GetMapping("/order")
    public String order(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        Cart cart = cartService.getCartByUser(user);
        model.addAttribute("cart", cart);
        return "order";
    }

    @PostMapping("/order")
    public String placeOrder(
            Model model,
            Principal principal,
            @RequestParam("name") String name,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("email") String email,
            @RequestParam("deliveryMethod") String deliveryMethod,
            @RequestParam(value = "city", required = false) String city,
            @RequestParam(value = "street", required = false) String street,
            @RequestParam(value = "house", required = false) String house,
            @RequestParam("payment") String paymentMethod
    ) {
        User user = userService.getUserByPrincipal(principal);
        Cart cart = cartService.getCartByUser(user);

        user.setName(name);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        userService.saveUser(user);

        Order order = orderService.createOrderFromCart(cart, deliveryMethod, city, street, house, paymentMethod);
        model.addAttribute("order", order);
        cartService.clearCart(cart);
        return "redirect:/order/confirmation";
    }

    @PostMapping("/orderItem/update-status")
    public String updateStatus(@RequestParam Long orderId, @RequestParam Long orderItemId, @RequestParam String status) {
        orderService.updateOrderItemStatus(orderId, orderItemId, status);
        return "redirect:/orders";
    }

    @GetMapping("/deliveries")
    public String deliveries(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        if (!user.isUser()) {
            return "redirect:/";
        }
        List<Order> orders = orderService.getOrdersByUser(user);
        model.addAttribute("orders", orders);
        model.addAttribute("user", user);
        return "deliveries";
    }
}
