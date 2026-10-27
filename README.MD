# 💻 Laptopshop - Nền Tảng Thương Mại Điện Tử Bán Laptop FullStack

<p align="center">
  <img src="https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring_Boot-3.2.2-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring_Security-6.0-6DB33F?style=for-the-badge&logo=spring-security&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/Bootstrap-5.3-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white" />
  <img src="https://img.shields.io/badge/Tests-26%20Passed-brightgreen?style=for-the-badge&logo=junit5&logoColor=white" />
</p>

---

## 🌟 1. Giới Thiệu Tổng Quan

**Laptopshop** là giải pháp website thương mại điện tử chuyên cung cấp và kinh doanh máy tính xách tay trực tuyến từ các thương hiệu hàng đầu (*Apple, Dell, Asus, Lenovo, HP, Acer, LG*). Ứng dụng được thiết kế và xây dựng theo mô hình **Monolithic MVC** kết hợp **Kiến trúc Phân tầng (Layered N-Tier Architecture)** chuẩn mực công nghiệp.

Dự án không chỉ đáp ứng hoàn chỉnh nghiệp vụ mua bán hàng trực tuyến mà còn chú trọng tối ưu hiệu năng truy vấn dữ liệu lớn bằng **Spring Data JPA Specification**, quản lý phiên làm việc bền vững bằng **Spring Session JDBC**, thiết lập tường lửa bảo mật đa tầng với **Spring Security (RBAC)** và đảm bảo tính tin cậy tuyệt đối với bộ **Unit Test tự động**.

> [!NOTE]
> Hệ thống tách biệt rõ ràng giữa hai phân hệ độc lập: **Khách hàng (Client Storefront)** phục vụ trải nghiệm mua sắm mượt mà, và **Quản trị viên (Admin Portal)** cung cấp công cụ vận hành, thống kê và kiểm soát toàn diện.

---

## 🚀 2. Các Tính Năng Nổi Bật

### 🛒 Phân hệ Khách hàng (Client Experience)
- **Trang chủ trực quan (`/`)**: Trình bày danh mục sản phẩm mới nhất, bán chạy và nổi bật với bố cục responsive trên mọi kích thước màn hình.
- **Bộ lọc sản phẩm thông minh (Dynamic Filtering - `/products`)**:
  - *Đa tiêu chí*: Lọc đồng thời theo nhiều thương hiệu (`Apple, Dell, Asus`), nhu cầu sử dụng (`Gaming, Văn phòng, Đồ họa`), khoảng giá (`<10tr, 10-15tr, 15-20tr, >20tr`), tìm kiếm theo tên và sắp xếp giá tăng/giảm dần.
  - *Đồng bộ URL 2 chiều*: Tự động cập nhật query parameters trên URL; hỗ trợ giữ nguyên bộ lọc khi chuyển qua lại giữa các trang phân trang mà không bị mất dữ liệu.
- **Giỏ hàng & Mua sắm linh hoạt (`/cart`)**: Thêm sản phẩm nhanh, kiểm tra tồn kho, cập nhật số lượng tức thời trên giao diện, tính tổng tiền tự động và xóa sản phẩm.
- **Quy trình Thanh toán & Đặt hàng (`/checkout`)**: Nhập thông tin người nhận, tạo đơn hàng snapshot giá tại thời điểm mua, xóa giỏ hàng và theo dõi tiến trình đơn qua trang **Lịch sử đơn hàng (`/order-history`)**.
- **Cổng xác thực tài khoản**: Đăng ký (`/register`), đăng nhập (`/login`), tính năng ghi nhớ đăng nhập (*Remember-Me*), và trang thông báo từ chối truy cập thân thiện (`/access_deny`).

### ⚙️ Phân hệ Quản trị (Admin Dashboard)
- **Bảng điều khiển trung tâm (`/admin`)**: Thống kê số lượng người dùng, tổng sản phẩm và tổng đơn hàng trong hệ thống.
- **Quản lý danh mục Laptop (`/admin/product`)**: Xem danh sách phân trang, thêm mới sản phẩm kèm upload ảnh minh họa, chỉnh sửa cấu hình giá/kho và xóa sản phẩm.
- **Quản lý tài khoản (`/admin/user`)**: Quản trị người dùng, phân quyền vai trò (`ADMIN` / `USER`), cập nhật thông tin và ảnh đại diện.
- **Quản lý đơn hàng (`/admin/order`)**: Xem chi tiết từng món hàng trong đơn, theo dõi tổng tiền và cập nhật trạng thái đơn hàng (*PENDING $\rightarrow$ SHIPPING $\rightarrow$ COMPLETE*).

---

## 💎 3. Điểm Nhấn Kỹ Thuật & Kiến Trúc Cốt Lõi

| Khía cạnh | Công nghệ & Kỹ thuật | Giá trị mang lại |
| :--- | :--- | :--- |
| **Kiến trúc phân tầng** | `Controller` $\rightarrow$ `Service` $\rightarrow$ `Repository` $\rightarrow$ `Entity` | Đảm bảo nguyên lý **Separation of Concerns (SoC)**, mã nguồn mạch lạc, dễ mở rộng và dễ bảo trì. |
| **Truy vấn lọc động** | **JPA Specification & Criteria API** | Tạo câu truy vấn động Type-safe 100%, an toàn tuyệt đối trước **SQL Injection**, tự động tối ưu hóa câu lệnh SQL và phân trang `Pageable`. |
| **Bảo mật & Phân quyền** | **Spring Security 6 (RBAC) + BCrypt** | Phân quyền URL đa tầng (`hasRole("ADMIN")`), băm mật khẩu một chiều có Salt ngẫu nhiên chống tấn công Rainbow Table. |
| **Ràng buộc dữ liệu** | **Jakarta Validation + Custom Validator** | Bắt lỗi chặt chẽ từ tầng Controller (`@Valid`, `BindingResult`) kết hợp annotation tự tạo `@StrongPassword` kiểm soát mật khẩu mạnh. |
| **Quản lý Session** | **Spring Session JDBC** | Dữ liệu phiên được lưu bền vững (*Persistent*) trong MySQL (`SPRING_SESSION`), server restart không mất đăng nhập, chống đăng nhập đồng thời (`maximumSessions(1)`). |
| **Kiểm thử tự động** | **JUnit 5 + Mockito + MockMvc** | **26/26 bài test tự động** đạt chuẩn, bao phủ toàn bộ CRUD Sản phẩm, CRUD Tài khoản và Phân quyền bảo mật. |

---

## 🛠 4. Ngăn Xếp Công Nghệ (Tech Stack)

### Backend
- **Ngôn ngữ cốt lõi**: Java 17 (LTS)
- **Framework chính**: Spring Boot 3.2.2 (Spring MVC, Spring Data JPA, Spring Security, Spring Session)
- **Cơ sở dữ liệu**: MySQL Server 8.0
- **Connection Pool**: HikariCP (tối ưu hóa kết nối CSDL hiệu năng cao)
- **Công cụ xây dựng**: Apache Maven 3.8+

### Frontend
- **Template Engine**: JSP (JavaServer Pages) & JSTL (JavaServer Pages Standard Tag Library)
- **CSS Framework**: Bootstrap 5.3 & Responsive Layout
- **Biểu tượng & Hiệu ứng**: Font Awesome 5, Bootstrap Icons, Owl Carousel
- **Xử lý tương tác**: JavaScript (ES6+), jQuery, URLSearchParams API

---

## 🧪 5. Kết Quả Kiểm Thử Hệ Thống (Automated Testing)

Toàn bộ nghiệp vụ quan trọng được bảo vệ bằng hệ thống Unit Test và Integration Test tự động:
- **`ProductServiceTest` (7 tests)**: Kiểm thử logic CRUD Sản phẩm, cập nhật tồn kho, phân trang và Specification.
- **`UserServiceTest` (8 tests)**: Kiểm thử logic CRUD Người dùng, kiểm tra trùng email, ánh xạ DTO và mã hóa mật khẩu.
- **`SecurityAuthorizationTest` (10 tests)**: Kiểm thử cơ chế bảo vệ URL, chặn người dùng trái phép, chuyển hướng đăng nhập và cấp phép Admin.
- **`LaptopshopApplicationTests` (1 test)**: Kiểm thử khởi tạo Spring Context.

> [!TIP]
> Chạy toàn bộ bộ test chỉ với một câu lệnh:
> ```bash
> mvn test
> # Kết quả: BUILD SUCCESS [Total tests run: 26, Failures: 0, Errors: 0]
> ```
