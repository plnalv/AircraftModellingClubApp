package by.aliyeva.aircraftmodellingclub.repositories;

import by.aliyeva.aircraftmodellingclub.models.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

}
