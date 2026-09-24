package vn.hoidanit.laptopshop.service;

import java.util.List;

import vn.hoidanit.laptopshop.domain.Role;

import org.springframework.security.config.authentication.UserServiceBeanDefinitionParser;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

  private final UserRepository userRepository;
  private final RoleRepository roleRepository;

  public UserService(UserRepository userRepository, RoleRepository roleRepository) {
    this.userRepository = userRepository;
    this.roleRepository = roleRepository;
  }

  public List<User> getAllUsers() {
    return this.userRepository.findAll();
  }

  public List<User> getAllUsersByEmail(String email) {
    return this.userRepository.findOneByEmail(email);
  }

  public User getUserByID(long id) {
    return this.userRepository.findById(id);
  }

  public void deleteUserById(long id) {
    this.userRepository.deleteById(id);
  }

  public User handleSaveUser(User user) {
    User eric = this.userRepository.save(user);
    return eric;
  }

  public Role getRoleByName(String name) {
    return this.roleRepository.findByName(name);
  }
}
