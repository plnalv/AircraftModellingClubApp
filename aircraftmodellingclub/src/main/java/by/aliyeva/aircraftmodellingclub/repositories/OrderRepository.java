package by.aliyeva.aircraftmodellingclub.repositories;

import by.aliyeva.aircraftmodellingclub.models.Order;
import by.aliyeva.aircraftmodellingclub.models.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);
    @EntityGraph(attributePaths = "orderItems.product.user")
    List<Order> findByOrderItemsProductUser(User seller);
}
