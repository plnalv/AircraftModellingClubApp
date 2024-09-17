package by.aliyeva.aircraftmodellingclub.repositories;

import by.aliyeva.aircraftmodellingclub.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
