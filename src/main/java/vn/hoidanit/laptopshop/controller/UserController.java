package vn.hoidanit.laptopshop.controller;

import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

  private UserService userService;

  public UserController(UserService userService) {
    this.userService = userService;
  }

  @RequestMapping("/hoidanit")
  public String getHomePage() {
    String test = this.userService.handleHello();
    return "eric.html";
  }

}

// @RestController
// public class UserController {
// // dependency injection
// private UserService userService;

// @GetMapping("")
// public String getHomePage() {
// return this.userService.handleHello();
// }
// }
