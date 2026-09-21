package vn.hoidanit.laptopshop.controller;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.UserService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
    List<User> arrUser = this.userService.getAllUsers();
    System.out.println(arrUser);
    model.addAttribute("eric", "test");
    model.addAttribute("hoidanit", "from controller with model");
    return "hello";
  }

  @RequestMapping("/admin/user")
  public String getUserPage(Model model) {
    List<User> users = this.userService.getAllUsers();
    model.addAttribute("users", users);
    return "admin/user/table-user";
  }

  @RequestMapping("/admin/user/{id}")
  public String getUserDetailPage(Model model, @PathVariable long id) {
    User users = this.userService.getUserByID(id);
    model.addAttribute("users", users);
    model.addAttribute("id", id);
    return "admin/user/show";
  }

  @RequestMapping("/admin/user/create") // GET
  public String getCreateUserPage(Model model) {
    model.addAttribute("newUser", new User());
    return "admin/user/create";
  }

  @RequestMapping("/admin/user/update/{id}") // Update
  public String getUpdateUserPage(Model model, @PathVariable long id) {
    User currentUser = this.userService.getUserByID(id);
    model.addAttribute("newUser", currentUser);
    return "admin/user/update";
  }

  @PostMapping("/admin/user/update") // Update
  public String postUpdateUser(Model model, @ModelAttribute("new User") User hoidanit) {
    User currentUser = this.userService.getUserByID(hoidanit.getId());
    if (currentUser != null) {
      currentUser.setAddress(hoidanit.getAddress());
      currentUser.setFullName(hoidanit.getFullName());
      currentUser.setPhone(hoidanit.getPhone());
      this.userService.handleSaveUser(currentUser);
    }
    return "redirect:/admin/user";
  }

  @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
  public String createUserPage(Model model, @ModelAttribute("new User") User hoidanit) {
    System.out.println("run here" + hoidanit);
    this.userService.handleSaveUser(hoidanit);
    return "redirect:/admin/user";

  }

  @GetMapping("/admin/user/delete/{id}") // Delete
  public String getDeleteUserPage(Model model, @PathVariable long id) {
    model.addAttribute("id", id);
    User user = new User();
    user.setId(id);
    model.addAttribute("newUser", user);
    return "admin/user/delete";
  }

  @PostMapping("/admin/user/delete") // Delete
  public String postDeleteUser(Model model, @ModelAttribute("newUser") User eric) {
    this.userService.deleteUserById(eric.getId());
    return "redirect:/admin/user";
  }
}