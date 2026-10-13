package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class ProductService {
  private final ProductRepository productRepository;
  private final CartRepository cartRepository;
  private final CartDetailRepository cartDetailRepository;
  private final UserService userService;

  public ProductService(ProductRepository productRepository, CartRepository cartRepository,
      CartDetailRepository cartDetailRepository, UserService userService) {
    this.productRepository = productRepository;
    this.cartRepository = cartRepository;
    this.cartDetailRepository = cartDetailRepository;
    this.userService = userService;
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

  public void hanldeAddProductToCart(String email, long productId) {
    User user = this.userService.getUserByEmail(email);
    if (user != null) {
      Cart cart = this.cartRepository.findByUser(user);
      if (cart == null) {
        Cart otherCart = new Cart();
        otherCart.setUser(user);
        otherCart.setSum(0);
        cart = this.cartRepository.save(otherCart);
      }
      Optional<Product> producOptional = this.productRepository.findById(productId);
      if (producOptional.isPresent()) {
        Product realProduct = producOptional.get();
        CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
        if (oldDetail == null) {
          CartDetail cartDetail = new CartDetail();
          cartDetail.setCart(cart);
          cartDetail.setProduct(realProduct);
          cartDetail.setPrice(realProduct.getPrice());
          cartDetail.setQuantity(1);
          this.cartDetailRepository.save(cartDetail);
          cart.setSum(cart.getSum() + 1);
          this.cartRepository.save(cart);
        } else {
          oldDetail.setQuantity(oldDetail.getQuantity() + 1);
          this.cartDetailRepository.save(oldDetail);
        }

      }
    }

  }
}
