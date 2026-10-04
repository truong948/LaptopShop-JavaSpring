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
  public String createProduct(Model model, @ModelAttribute("newProduct") @Valid Product pr,
      BindingResult bindingResult, @RequestParam(value = "hoidanitFile", required = false) MultipartFile file) {

    if (bindingResult.hasErrors()) {
      return "admin/product/create";
    }

    if (file != null && !file.isEmpty()) {
      String productImage = this.uploadService.handleSaveUploadFile(file, "product");
      pr.setImage(productImage);
    }
    this.productService.handleSaveProduct(pr);
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

  @PostMapping(value = "/admin/product/update") // Update
  public String postUpdateProduct(Model model, @ModelAttribute("newProduct") Product hoidanit,
      @RequestParam(value = "hoidanitFile", required = false) MultipartFile file) {
    Product currentProduct = this.productService.getProductByID(hoidanit.getId());
    if (currentProduct != null) {
      currentProduct.setName(hoidanit.getName());
      currentProduct.setPrice(hoidanit.getPrice());
      currentProduct.setDetailDesc(hoidanit.getDetailDesc());
      currentProduct.setShortDesc(hoidanit.getShortDesc());
      currentProduct.setQuantity(hoidanit.getQuantity());
      currentProduct.setSold(hoidanit.getSold());
      currentProduct.setFactory(hoidanit.getFactory());
      currentProduct.setTarget(hoidanit.getTarget());

      if (file != null && !file.isEmpty()) {
        currentProduct.setImage(this.uploadService.handleSaveUploadFile(file, "product"));
      } else if (hoidanit.getImage() != null && !hoidanit.getImage().isBlank()) {
        currentProduct.setImage(hoidanit.getImage());
      }

      this.productService.handleSaveProduct(currentProduct);
    }
    return "redirect:/admin/product";
  }

  @GetMapping("/admin/product/delete/{id}") // Delete
  public String getDeleteProductPage(Model model, @PathVariable long id) {
    model.addAttribute("id", id);
    Product product = new Product();
    product.setId(id);
    model.addAttribute("newProduct", product);
    return "admin/product/delete";
  }

  @PostMapping("/admin/product/delete") // Delete
  public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product abc) {
    this.productService.deleteProductById(abc.getId());
    return "redirect:/admin/product";
  }

}
