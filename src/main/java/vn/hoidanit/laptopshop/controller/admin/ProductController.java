package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
  public String createProduct(Model model, @ModelAttribute("newProduct") @Valid Product hoidanit,
      BindingResult bindingResult, @RequestParam("hoidanitFile") MultipartFile file) {

    if (bindingResult.hasErrors()) {
      return "admin/product/create";
    }

    String productImage = this.uploadService.handleSaveUploadFile(file, "product");
    hoidanit.setImage(productImage);
    this.productService.handleSaveProduct(hoidanit);

    return "redirect:/admin/product";
  }

  @GetMapping("/admin/product/{id}")
  public String getProductDetailPage(Model model, @PathVariable long id) {
    Product products = this.productService.getProductByID(id);
    model.addAttribute("products", products);
    model.addAttribute("id", id);
    return "admin/product/detail";
  }

  @RequestMapping("/admin/product/update/{id}") // Update
  public String getUpdateUserProduct(Model model, @PathVariable long id) {
    Product currentProduct = this.productService.getProductByID(id);
    model.addAttribute("newProduct", currentProduct);
    return "admin/product/update";
  }

  @PostMapping("/admin/product/update") // Update
  public String postUpdateProduct(Model model, @ModelAttribute("newProduct") Product hoidanit) {
    Product currentProduct = this.productService.getProductByID(hoidanit.getId());
    // if (currentUser != null) {
    // currentUser.setAddress(hoidanit.getAddress());
    // currentUser.setFullName(hoidanit.getFullName());
    // currentUser.setPhone(hoidanit.getPhone());

    // }
    this.productService.handleSaveProduct(currentProduct);
    return "redirect:/admin/product";
  }

}
