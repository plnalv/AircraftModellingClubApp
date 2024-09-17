package by.aliyeva.aircraftmodellingclub.repositories;

import by.aliyeva.aircraftmodellingclub.models.Cart;
import by.aliyeva.aircraftmodellingclub.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}