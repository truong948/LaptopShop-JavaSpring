package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class ProductController {
  private final ProductService productService;

  public ProductController(ProductService productService) {
    this.productService = productService;
  }

  @GetMapping("/admin/product")
  public String getProduct(Model model) {
    List<Product> products = this.productService.getAllProduct();
    model.addAttribute("products", products);
    return "admin/product/show";
  }

  @GetMapping("/admin/product/create")
  public String createProduct(Model model) {
    return "admin/product/create";
  }

}
