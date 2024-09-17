package by.aliyeva.aircraftmodellingclub.services;

import by.aliyeva.aircraftmodellingclub.models.Cart;
import by.aliyeva.aircraftmodellingclub.models.CartItem;
import by.aliyeva.aircraftmodellingclub.models.Product;
import by.aliyeva.aircraftmodellingclub.models.User;
import by.aliyeva.aircraftmodellingclub.repositories.CartItemRepository;
import by.aliyeva.aircraftmodellingclub.repositories.CartRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductService productService;

    public Cart getCartByUser(User user) {
        return cartRepository.findByUser(user);
    }

    public void addItemToCart(User user, Product product) {
        Cart cart = getCartByUser(user);
        if(cart == null) {
            cart = new Cart();
            cart.setUser(user);
            cartRepository.save(cart);
        }
        CartItem cartItem = cartItemRepository.findByCartAndProduct(cart, product);
        if(cartItem == null) {
            cartItem = new CartItem();
            cartItem.setCart(cart);
            cartItem.setProduct(product);
            cartItem.setQuantity(1);
            cartItemRepository.save(cartItem);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            cartItemRepository.save(cartItem);
        }
        updateCartTotals(cart);
    }


    public void removeItemFromCart(User user, Long cartItemId) {
        Cart cart = getCartByUser(user);
        CartItem cartItem = cartItemRepository.findById(cartItemId).orElseThrow();
        if (cartItem != null && cartItem.getCart().getUser().equals(user)) {
            cartItemRepository.delete(cartItem);
        }
        updateCartTotals(cart);
    }


     public List<CartItem> getCartItems(User user) {
        Cart cart = getCartByUser(user);
        return cartItemRepository.findByCartOrderByProductAsc(cart);
     }


    public void updateCartItemQuantity(User user, Long cartItemId, int quantity) {
        Cart cart = getCartByUser(user);
        CartItem cartItem = cartItemRepository.findById(cartItemId).orElseThrow();
        if (cartItem != null && cartItem.getCart().getUser().equals(user)) {
            cartItem.setQuantity(quantity);
            cartItemRepository.save(cartItem);
        }
        updateCartTotals(cart);
    }

    private void updateCartTotals(Cart cart) {
        int totalQuantity = 0;
        double totalPrice = 0;
        if (cart.getItems() != null){
            for (CartItem item : cart.getItems()) {
                totalQuantity += item.getQuantity();
                totalPrice += item.getProduct().getPrice() * item.getQuantity();
            }
        }
        cart.setTotalQuantity(totalQuantity);
        cart.setTotalPrice(totalPrice);
        cartRepository.save(cart);
    }

    @Transactional
    public void clearCart(Cart cart) {
        for (CartItem cartItem : new ArrayList<>(cart.getItems())) {
            cart.removeItem(cartItem);
            cartItemRepository.delete(cartItem);
        }
        cart.setTotalQuantity(0);
        cart.setTotalPrice(0.0);
        cartRepository.save(cart);
    }
}
