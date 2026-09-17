<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create A User</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
      </head>

      <body>
        <div class="container mt-5">
          <div class="row justify-content-center">
            <!-- Tăng độ rộng form: col-md-8 col-lg-7 giúp form mở rộng hơn -->
            <div class="col-12 col-md-8 col-lg-7">

              <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white text-center py-3">
                  <h4 class="mb-0 fw-bold">Create A User</h4>
                </div>

                <div class="card-body p-4 p-md-5">
                  <form:form action="/admin/user/create" method="post" modelAttribute="newUser">

                    <div class="mb-3">
                      <label class="form-label fw-semibold">Email address</label>
                      <!-- Thêm form-control-lg để tăng chiều cao ô nhập -->
                      <form:input type="email" class="form-control form-control-lg" path="email" required="required"
                        placeholder="name@example.com" />
                    </div>

                    <div class="mb-3">
                      <label class="form-label fw-semibold">Password</label>
                      <form:input type="password" class="form-control form-control-lg" path="password"
                        placeholder="••••••••" />
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
      </body>

      </html>