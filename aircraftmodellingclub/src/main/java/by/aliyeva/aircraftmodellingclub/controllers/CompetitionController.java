package by.aliyeva.aircraftmodellingclub.controllers;

import by.aliyeva.aircraftmodellingclub.models.Competition;

import by.aliyeva.aircraftmodellingclub.models.CompetitionParticipants;
import by.aliyeva.aircraftmodellingclub.models.Product;
import by.aliyeva.aircraftmodellingclub.models.User;
import by.aliyeva.aircraftmodellingclub.services.CompetitionService;
import by.aliyeva.aircraftmodellingclub.services.ProductService;
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
public class CompetitionController {
    private final UserService userService;
    private final CompetitionService competitionService;
    private final ProductService productService;

    @GetMapping("/my/competitions")
    public String myCompetitions(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        List<Competition> userCompetitions = competitionService.getCompetitionsByUser(user);
        model.addAttribute("user", user);
        model.addAttribute("competitions", userCompetitions);
        return "my-competitions";
    }

    @GetMapping("/competitions")
    public String competitions(Model model, Principal principal) {
        List<Competition> competitions = competitionService.list();
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("competitions", competitions);
        return "competitions";
    }

    @GetMapping("/competition-signup")
    public String showCompetitionSignupForm(Model model, Principal principal, @RequestParam("competitionId") Long competitionId) {
        Competition competition = competitionService.getCompetitionById(competitionId);
        model.addAttribute("competition", competition);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("products", productService.listProducts(null));
        return "competition-signup";
    }

    @PostMapping("/competition-signup")
    public String signUpForCompetition(@RequestParam("competitionId") Long competitionId,
                                       @RequestParam("useOwnProduct") boolean useOwnProduct,
                                       @RequestParam(value = "productId", required = false) Long productId,
                                       Principal principal) {
        User user = productService.getUserByPrincipal(principal);
        Competition competition = competitionService.getCompetitionById(competitionId);
        if (competition.getMaxParticipants() <= competition.getCompetitionParticipants().size()) {
            throw new RuntimeException("Competition is full");
        }
        if (!useOwnProduct && productId == null) {
            throw new RuntimeException("Product must be selected if using a booked product");
        }
        CompetitionParticipants competitionParticipant = new CompetitionParticipants();
        competitionParticipant.setUser(user);
        competitionParticipant.setCompetition(competition);
        if (useOwnProduct) {
            competitionParticipant.setProduct(null);
        } else {
            Product bookedProduct = productService.getProductById(productId);
            competitionParticipant.setProduct(bookedProduct);
        }
        competitionService.addCompetitionParticipant(competition, competitionParticipant);
        return "redirect:/competitions";
    }
}
