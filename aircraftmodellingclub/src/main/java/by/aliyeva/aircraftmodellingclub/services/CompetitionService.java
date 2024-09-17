package by.aliyeva.aircraftmodellingclub.services;

import by.aliyeva.aircraftmodellingclub.models.Competition;
import by.aliyeva.aircraftmodellingclub.models.CompetitionParticipants;
import by.aliyeva.aircraftmodellingclub.models.User;
import by.aliyeva.aircraftmodellingclub.repositories.CompetitionParticipantsRepository;
import by.aliyeva.aircraftmodellingclub.repositories.CompetitionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class CompetitionService {
    @Autowired
    private CompetitionRepository competitionRepository;
    @Autowired
    private CompetitionParticipantsRepository competitionParticipantsRepository;

    public List<Competition> list() {
        return competitionRepository.findAll();
    }

    public void createCompetition(String title, String description, String location, LocalDate date, Integer maxParticipants) {
        Competition competition = new Competition();
        competition.setTitle(title);
        competition.setDescription(description);
        competition.setLocation(location);
        competition.setDate(date);
        competition.setMaxParticipants(maxParticipants);
        competitionRepository.save(competition);
    }

    public void updateCompetition(Long id, String title, String description, String location, Optional<LocalDate> date, Optional<Integer> maxParticipants) {
        Competition competition = competitionRepository.findById(id).orElseThrow();
        competition.setTitle(title);
        competition.setDescription(description);
        competition.setLocation(location);
        if (date.isPresent()) {
            competition.setDate(date.get());
        }
        if (maxParticipants.isPresent()) {
            competition.setMaxParticipants(maxParticipants.get());
        }
        competitionRepository.save(competition);
    }

    public void deleteCompetition(Long id) {
        competitionRepository.deleteById(id);
    }

    public Competition getCompetitionById(Long id) {
        return competitionRepository.findById(id).orElseThrow();
    }

    public List<CompetitionParticipants> getParticipants(Competition competition) {
        return competition.getCompetitionParticipants();
    }

    public void addCompetitionParticipant(Competition competition, CompetitionParticipants competitionParticipant) {
        competitionParticipant.setCompetition(competition);
        competitionParticipantsRepository.save(competitionParticipant);
    }

    public List<Competition> getCompetitionsByUser(User user) {
        return competitionRepository.findUserCompetitions(user);
    }
}
