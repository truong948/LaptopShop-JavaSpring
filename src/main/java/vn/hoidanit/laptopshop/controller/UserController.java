package vn.hoidanit.laptopshop.controller;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

  private final UserService userService;

  public UserController(UserService userService) {
    this.userService = userService;

  }

  @RequestMapping("/")
  public String getHomePage(Model model) {

    model.addAttribute("eric", "test");
    model.addAttribute("hoidanit", "from controller with model");
    return "hello";
  }

  @RequestMapping("/admin/user")
  public String getCreateUserPage(Model model) {
    model.addAttribute("newUser", new User());
    model.addAttribute("hoidanit", "from controller with model");
    return "admin/user/create";
  }

  @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
  public String createUserPage(Model model, @ModelAttribute("new User") User hoidanit) {
    System.out.println("run here" + hoidanit);
    this.userService.handleSaveUser(hoidanit);
    return "hello";

  }
}