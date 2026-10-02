<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product User</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
      </head>

      <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />

        <div id="layoutSidenav">
          <jsp:include page="../layout/sidebar.jsp" />

          <div id="layoutSidenav_content">
            <main>
              <div class="container-fluid px-4">
                <div class="container-fluid px-4">
                  <h1 class="mt-4">Detail Product</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Detail</li>
                  </ol>
                </div>
                <div class="container mt-5">
                  <div class="row justify-content-center">
                    <!-- Tăng độ rộng form: col-md-8 col-lg-7 giúp form mở rộng hơn -->
                    <div class="col-12 col-md-8 col-lg-7">

                      <div class="card">
                        <div class="card-header bg-primary text-white text-center py-3">
                          <h4 class="mb-0 fw-bold">Product Details (id=${id})</h4>
                        </div>
                        <div class="card" style="width: 24rem;">
                          <div class="card-header">
                            Product Information
                          </div>
                          <ul class="list-group list-group-flush">
                            <li class="list-group-item"><strong>ID:</strong> ${products.id}</li>
                            <li class="list-group-item"><strong>Name:</strong> ${products.name}</li>
                            <li class="list-group-item"><strong>Price:</strong> ${products.price}</li>
                            <li class="list-group-item"><strong>Detail:</strong> ${products.detailDesc}</li>
                            <li class="list-group-item"><strong>Short:</strong> ${products.shortDesc}</li>
                            <li class="list-group-item"><strong>Quantity:</strong> ${products.quantity}</li>
                            <li class="list-group-item"><strong>Sold:</strong> ${products.sold}</li>
                            <li class="list-group-item"><strong>Factory:</strong> ${products.factory}</li>
                            <li class="list-group-item"><strong>Target:</strong> ${products.target}</li>
                            <li class="list-group-item"><strong>Image:</strong>
                              <c:if test="${not empty products.image}">
                                <img src="${products.image}" alt="product image"
                                  style="max-width:100%;max-height:200px;" />
                              </c:if>
                            </li>
                          </ul>
                        </div>
                        <a href="/admin/product" class="btn btn-success mt-3">BACK</a>



                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </main>
          </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
      </body>

      </html>