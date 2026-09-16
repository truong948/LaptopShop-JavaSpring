package vn.hoidanit.laptopshop.domain;

public class User {
  private long id;
  private String email;
  private String password;
  private String fullName;
  private String address;
  private String phone;

  public User() {

  }

  public User(long id, String email, String password, String fullName, String address, String phone) {
    this.id = id;
    this.email = email;
    this.password = password;
    this.fullName = fullName;
    this.address = address;
    this.phone = phone;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail() {
    this.email = email;
  }

  @Override
  public String toString() {
    return "User [id=" + id + ", email=" + email + ", password=" + password + ", fullName=" + fullName
        + ", address=" + address + ", phone=" + phone + "]";
  }

}
