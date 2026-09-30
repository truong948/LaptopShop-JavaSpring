package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class ProductController {
  private final ProductService productService;
  private final UploadService uploadService;

  public ProductController(ProductService productService, UploadService uploadService) {
    this.productService = productService;
    this.uploadService = uploadService;
  }

  @GetMapping("/admin/product")
  public String getProduct(Model model) {
    List<Product> products = this.productService.getAllProduct();
    model.addAttribute("products", products);
    return "admin/product/show";
  }

  @GetMapping("/admin/product/create")
  public String getCreateProduct(Model model) {
    model.addAttribute("newProduct", new Product());
    return "admin/product/create";
  }

  @PostMapping("/admin/product/create")
  public String createProduct(Model model, @ModelAttribute("newProduct") Product hoidanit,
      @RequestParam("hoidanitFile") MultipartFile file) {
    String productImage = this.uploadService.handleSaveUploadFile(file, "product");
    model.addAttribute("newProduct", new Product());
    hoidanit.setImage(productImage);
    this.productService.handleSaveProduct(hoidanit);

    return "admin/product/create";

  }

}
