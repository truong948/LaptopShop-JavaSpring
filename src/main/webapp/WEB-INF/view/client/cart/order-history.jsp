<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8">
        <title>Lịch sử mua hàng - Laptopshop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
          href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
          rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="/client/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/client/css/style.css" rel="stylesheet">
      </head>

      <body>

        <jsp:include page="../layout/header.jsp" />

        <!-- Order History Start -->
        <div class="container-fluid py-5">
          <div class="container py-5">
            <div>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                </ol>
              </nav>
            </div>

            <c:if test="${empty orders}">
              <div class="alert alert-info text-center">
                Bạn chưa có đơn hàng nào.
              </div>
            </c:if>

            <c:if test="${not empty orders}">
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead class="table-success">
                    <tr>
                      <th scope="col">Sản phẩm</th>
                      <th scope="col">Tên</th>
                      <th scope="col">Giá cả</th>
                      <th scope="col">Số lượng</th>
                      <th scope="col">Thành tiền</th>
                      <th scope="col">Trạng thái</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="order" items="${orders}">
                      <!-- Order header row -->
                      <tr class="table-light">
                        <td><b>Order Id = ${order.id}</b></td>
                        <td></td>
                        <td>
                          <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                        </td>
                        <td></td>
                        <td></td>
                        <td>${order.status}</td>
                      </tr>
                      <!-- Order detail rows -->
                      <c:forEach var="orderDetail" items="${order.orderDetails}">
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="/images/product/${orderDetail.product.image}"
                                class="img-fluid rounded-circle" style="width: 80px; height: 80px;" alt="">
                            </div>
                          </td>
                          <td>${orderDetail.product.name}</td>
                          <td>
                            <fmt:formatNumber type="number" value="${orderDetail.price}" /> đ
                          </td>
                          <td>${orderDetail.quantity}</td>
                          <td>
                            <fmt:formatNumber type="number" value="${orderDetail.price * orderDetail.quantity}" /> đ
                          </td>
                          <td></td>
                        </tr>
                      </c:forEach>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:if>
          </div>
        </div>
        <!-- Order History End -->

        <jsp:include page="../layout/footer.jsp" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/client/lib/easing/easing.min.js"></script>
        <script src="/client/lib/waypoints/waypoints.min.js"></script>
        <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
        <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="/client/js/main.js"></script>
      </body>

      </html>

