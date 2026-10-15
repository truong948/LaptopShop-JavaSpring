<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8">
        <title>${product.name} - Laptopshop</title>
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
        <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/client/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/client/css/style.css" rel="stylesheet">
      </head>

      <body>

        <jsp:include page="../layout/header.jsp" />
        <!-- Cart Page Start -->
        <div>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Chi Tiết</li>
            </ol>
          </nav>
        </div>
        <div class="container-fluid py-5">
          <div class="container py-5">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Gía cả</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col">Xử lý</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="cartDetail" items="${cartDetails}">
                    <tr>
                      <th scope="row">
                        <div class="d-flex align-items-center">
                          <img src="/images/product/${cartDetail.product.image}" class="img-fluid me-5 rounded-circle"
                            style="width: 80px; height: 80px;" alt="">
                        </div>
                      </th>
                      <td>
                        <p class="mb-0 mt-4">
                          <a href="/product/${cartDetail.product.id}" target="_blank">
                            ${cartDetail.product.name}
                          </a>
                        </p>
                      </td>
                      <td>
                        <p class="mb-0 mt-4">
                          <fmt:formatNumber type="number" value="${cartDetail.product.price}" /> đ
                        </p>
                      </td>
                      <td>
                        <div class="input-group quantity mt-4" style="width: 100px;">
                          <div class="input-group-btn">
                            <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                              <i class="fa fa-minus"></i>
                            </button>
                          </div>
                          <input type="text" class="form-control form-control-sm text-center border-0"
                            value="${cartDetail.quantity}" data-cart-detail-id="${cartDetail.id}"
                            data-cart-detail-price="${cartDetail.price}">

                          <div class="input-group-btn">
                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                              <i class="fa fa-plus"></i>
                            </button>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}"></p>
                        <fmt:formatNumber type="number" value="${cartDetail.product.price * cartDetail.quantity}" /> đ
                      </td>
                      <<td>
                        <form method="post" action="/delete-cart-product/${cartDetail.id}">
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                          <button class="btn btn-md rounded-circle bg-light border mt-4">
                            <i class="fa fa-times text-danger"></i>
                          </button>
                        </form>
                        </td>


                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

            <div class="mt-5 row g-4 justify-content-start">
              <div class="col-12 col-md-8">
                <div class="bg-light rounded">
                  <div class="p-4">
                    <h1 class="display-6 mb-4">Thông Tin <span class="fw-normal">Đơn Hàng</span></h1>
                    <div class="d-flex justify-content-between mb-4">
                      <h5 class="mb-0 me-4">Tạm tính:</h5>
                      <p class=" mb-0" data-cart-total-price="${totalPrice}">
                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                      </p>
                    </div>
                    <div class="d-flex justify-content-between">
                      <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                      <div class="">
                        <p class="mb-0">0 đ</p>
                      </div>
                    </div>
                    <p class="mb-0 text-end">Shipping to Ukraine.</p>
                  </div>
                  <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                    <h5 class="mb-0 ps-4 me-4">Total</h5>
                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                      <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                    </p>
                  </div>
                  <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                    type="button">Proceed Checkout</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <jsp:include page="../layout/footer.jsp" />
        <!-- Cart Page End -->
      </body>

      </html>