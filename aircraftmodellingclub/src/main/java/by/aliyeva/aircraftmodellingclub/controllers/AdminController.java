package by.aliyeva.aircraftmodellingclub.controllers;

import by.aliyeva.aircraftmodellingclub.models.User;
import by.aliyeva.aircraftmodellingclub.models.enums.Role;
import by.aliyeva.aircraftmodellingclub.services.CompetitionService;
import by.aliyeva.aircraftmodellingclub.services.UserService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final CompetitionService competitionService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }


    @GetMapping("/admin/user/edit/{id}")
    public String userEdit(@PathVariable Long id, Model model){

        User user = userService.getUserById(id);

        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";

    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }

    @GetMapping("/admin/competitions")
    public String competitions(Model model, Principal principal) {
        model.addAttribute("competitions", competitionService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin-competitions";
    }

    @PostMapping("/admin/competition/create")
    public String createCompetition(@RequestParam("title") String title,
                                    @RequestParam("description") String description,
                                    @RequestParam("location") String location,
                                    @RequestParam("date") @DateTimeFormat(pattern = "yyy-MM-dd") LocalDate date,
                                    @RequestParam("maxParticipants") Integer maxParticipants) {
        competitionService.createCompetition(title, description, location, date, maxParticipants);
        return "redirect:/admin/competitions";
    }

    @PostMapping("/admin/competition/update/{id}")
    public String updateCompetition(@PathVariable Long id,
                                    @RequestParam("title") String title,
                                    @RequestParam("description") String description,
                                    @RequestParam("location") String location,
                                    @RequestParam("date")@DateTimeFormat(pattern = "yyy-MM-dd") Optional<LocalDate> date,
                                    @RequestParam("maxParticipants") Optional<Integer> maxParticipants) {
        competitionService.updateCompetition(id, title, description, location, date, maxParticipants);
        return "redirect:/admin/competitions";
    }

    @PostMapping("/admin/competition/delete/{id}")
    public String deleteCompetition(@PathVariable Long id) {
        competitionService.deleteCompetition(id);
        return "redirect:/admin/competitions";
    }
}
