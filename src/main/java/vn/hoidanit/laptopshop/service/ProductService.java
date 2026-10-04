package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class ProductService {
  private final ProductRepository productRepository;

  public ProductService(ProductRepository productRepository) {
    this.productRepository = productRepository;

  }

  public List<Product> getAllProduct() {
    return this.productRepository.findAll();
  }

  public Product handleSaveProduct(Product product) {
    Product item = this.productRepository.save(product);
    return item;
  }

  public Product getProductByID(long id) {
    return this.productRepository.getById(id);
  }

  public void deleteProductById(long id) {
    this.productRepository.deleteById(id);
  }

  public Product createProduct(Product pr) {
    return this.productRepository.save(pr);
  }

  public Optional<Product> fetchProductsById(long id) {
    return this.productRepository.findById(id);
  }

  public List<Product> fetchProducts() {
    return this.productRepository.findAll();
  }
}
