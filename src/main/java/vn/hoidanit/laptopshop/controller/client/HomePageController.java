package vn.hoidanit.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

@Controller
public class HomePageController {
  private final ProductService productService;
  private final UserService userService;
  private final PasswordEncoder passwordEncoder;

  public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
    this.productService = productService;
    this.userService = userService;
    this.passwordEncoder = passwordEncoder;
  }

  @GetMapping("/")
  public String getHomePage(Model model) {
    List<Product> products = this.productService.fetchProducts();
    model.addAttribute("products", products);
    return "client/homepage/show";
  }

  @GetMapping("/register")
  public String getRegisterPage(Model model) {
    model.addAttribute("registerUser", new RegisterDTO());
    return "client/auth/register";
  }

  @PostMapping("/register")
  public String handleRegister(@Valid @ModelAttribute("registerUser") RegisterDTO registerDTO,
      BindingResult bindingResult, Model model) {
    // server-side validation: if DTO has field errors, return to register page and
    // show errors
    if (bindingResult.hasErrors()) {
      return "client/auth/register";
    }
    // validate combined full name length to match User entity constraint
    String fullName = (registerDTO.getFirstName() == null ? "" : registerDTO.getFirstName().trim()) + " "
        + (registerDTO.getLastName() == null ? "" : registerDTO.getLastName().trim());
    if (fullName.trim().length() < 3) {
      bindingResult.rejectValue("firstName", "fullName.short", "Fullname phải có tối thiểu 3 ký tự");
      return "client/auth/register";
    }

    // ensure password and confirmPassword match before creating User
    String pass = registerDTO.getPassword();
    String confirm = registerDTO.getConfirmPassword();
    if (pass == null || confirm == null || !pass.equals(confirm)) {
      bindingResult.rejectValue("confirmPassword", "password.mismatch",
          "Mật khẩu và xác nhận mật khẩu phải giống nhau");
      return "client/auth/register";
    }

    User user = this.userService.registerDTOtoUser(registerDTO);
    String hashPassword = this.passwordEncoder.encode(user.getPassword());
    user.setPassword(hashPassword);
    user.setRole(this.userService.getRoleByName("User"));
    this.userService.handleSaveUser(user);
    return "redirect:/login";
  }

  @GetMapping("/login")
  public String getLoginPage(Model model) {
    return "client/auth/login";
  }
}
