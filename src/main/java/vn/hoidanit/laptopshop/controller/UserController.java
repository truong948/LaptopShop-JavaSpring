package vn.hoidanit.laptopshop.controller;

import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

// @Controller
// public class UserController {

//   @RequestMapping("/")
//   public String getHomePage() {
//     return "hello";
//   }
// }

@RestController
public class UserController {

  private UserService userService;

  @GetMapping("")
  public String getHomePage() {
    return "hello Java Spring MVC";
  }
}
