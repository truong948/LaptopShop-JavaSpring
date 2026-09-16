package vn.hoidanit.laptopshop.service;

import org.springframework.security.config.authentication.UserServiceBeanDefinitionParser;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

@Service
public class UserService {

  public String handleHello() {
    return "hello from service";
  }
}
