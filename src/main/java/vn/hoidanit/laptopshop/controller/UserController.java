package vn.hoidanit.laptopshop.controller;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

  private final UserService userService;

  // SỬA TẠI ĐÂY: Chỉ nhận duy nhất 1 tham số là UserService
  public UserController(UserService userService) {
    this.userService = userService;
  }

  @RequestMapping("/")
  public String getHomePage(Model model) {
    String test = this.userService.handleHello();
    User user = new User(1L, "admin@gmail.com", "123456", "Nguyen Van A", "Ha Noi", "0123456789");
    String test1 = user.toString();

    model.addAttribute("eric", test);
    model.addAttribute("create", test1);
    model.addAttribute("hoidanit", "from controller with model");
    return "hello";
  }

  // Nếu muốn render trang create.jsp theo cây thư mục hiện tại:
  @RequestMapping("/admin/user/create")
  public String getCreateUserPage(Model model) {
    return "admin/user/create";
  }
}