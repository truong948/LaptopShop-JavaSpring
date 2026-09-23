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
        <title>Update User</title>
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
                  <h1 class="mt-4">Update User</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Update</li>
                  </ol>
                </div>
                <div class="container mt-5">
                  <div class="row justify-content-center">
                    <!-- Tăng độ rộng form: col-md-8 col-lg-7 giúp form mở rộng hơn -->
                    <div class="col-12 col-md-8 col-lg-7">

                      <div class="card shadow-sm border-0">
                        <div class="card-header bg-primary text-white text-center py-3">
                          <h4 class="mb-0 fw-bold">Update A User</h4>
                        </div>

                        <div class="card-body p-4 p-md-5">
                          <form:form action="/admin/user/update" method="post" modelAttribute="newUser">
                            <div class="mb-3" style="display:none;">
                              <label class="form-label fw-semibold">Id</label>
                              <form:input type="text" class="form-control form-control-lg" path="id" />
                            </div>
                            <div class="mb-3">
                              <label class="form-label fw-semibold">Email address</label>
                              <!-- Thêm form-control-lg để tăng chiều cao ô nhập -->
                              <form:input type="email" class="form-control form-control-lg" path="email"
                                disabled="true" />
                            </div>



                            <div class="mb-3">
                              <label class="form-label fw-semibold">Phone number</label>
                              <form:input type="text" class="form-control form-control-lg" path="phone"
                                placeholder="0901234567" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Full Name</label>
                              <!-- Đổi path="fullname" thành path="fullName" -->
                              <form:input type="text" class="form-control form-control-lg" path="fullName"
                                placeholder="Nguyễn Văn A" />
                            </div>

                            <div class="mb-4">
                              <label class="form-label fw-semibold">Address</label>
                              <form:input type="text" class="form-control form-control-lg" path="address"
                                placeholder="Địa chỉ thường trú" />
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg w-100 fw-semibold">Submit</button>

                          </form:form>
                        </div>
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