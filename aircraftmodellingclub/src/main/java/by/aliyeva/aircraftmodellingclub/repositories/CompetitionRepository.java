package by.aliyeva.aircraftmodellingclub.repositories;

import by.aliyeva.aircraftmodellingclub.models.Competition;
import by.aliyeva.aircraftmodellingclub.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CompetitionRepository extends JpaRepository<Competition, Long> {
    @Query("SELECT c FROM Competition c JOIN c.competitions cp WHERE cp.user = :user")
    List<Competition> findUserCompetitions(@Param("user") User user);
}
