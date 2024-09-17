package by.aliyeva.aircraftmodellingclub.repositories;

import by.aliyeva.aircraftmodellingclub.models.Cart;
import by.aliyeva.aircraftmodellingclub.models.CartItem;
import by.aliyeva.aircraftmodellingclub.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    CartItem findByCartAndProduct(Cart cart, Product product);
    List<CartItem> findByCartOrderByProductAsc(Cart cart);
    List<CartItem> findByProduct(Product product);
    void deleteAllByCart(Cart cart);
}
