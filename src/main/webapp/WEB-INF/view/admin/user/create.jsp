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
        <title>Create User</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>
          $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
              const imgURL = URL.createObjectURL(e.target.files[0]);
              $("#avatarPreview").attr("src", imgURL);
              $("#avatarPreview").css({ "display": "block" });
            });
          });
        </script>

      </head>

      <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />

        <div id="layoutSidenav">
          <jsp:include page="../layout/sidebar.jsp" />

          <div id="layoutSidenav_content">
            <main>
              <div class="container-fluid px-4">
                <h1 class="mt-4">Create User</h1>
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                  <li class="breadcrumb-item active">Create</li>
                </ol>

                <div class="mt-4 mb-5">
                  <div class="row justify-content-center">
                    <div class="col-12 col-lg-8">

                      <div class="card shadow-sm border-0">
                        <div class="card-header bg-primary text-white text-center py-3">
                          <h4 class="mb-0 fw-bold">Create A User</h4>
                        </div>

                        <div class="card-body p-4 p-md-5">
                          <!-- Chuyển class "row g-3" vào form:form -->
                          <form:form action="/admin/user/create" method="post" modelAttribute="newUser" class="row g-3"
                            enctype="multipart/form-data">

                            <!-- Cột 1 hàng 1: Email (nửa hàng bên trái) -->
                            <div class="col-12 col-md-6">
                              <label class="form-label fw-semibold">Email address</label>
                              <form:input type="email" class="form-control form-control-lg" path="email"
                                required="required" placeholder="name@example.com" />
                            </div>

                            <!-- Cột 2 hàng 1: Password (nửa hàng bên phải) -->
                            <div class="col-12 col-md-6">
                              <label class="form-label fw-semibold">Password</label>
                              <form:input type="password" class="form-control form-control-lg" path="password"
                                required="required" placeholder="••••••••" />
                            </div>

                            <!-- Cột 1 hàng 2: Phone number -->
                            <div class="col-12 col-md-6">
                              <label class="form-label fw-semibold">Phone number</label>
                              <form:input type="text" class="form-control form-control-lg" path="phone"
                                placeholder="0901234567" />
                            </div>

                            <!-- Cột 2 hàng 2: Full Name -->
                            <div class="col-12 col-md-6">
                              <label class="form-label fw-semibold">Full Name</label>
                              <form:input type="text" class="form-control form-control-lg" path="fullName"
                                placeholder="Nguyễn Văn A" />
                            </div>

                            <div class="col-12">
                              <label class="form-label fw-semibold">Address</label>
                              <form:input type="text" class="form-control form-control-lg" path="address"
                                placeholder="Địa chỉ thường trú" />
                            </div>

                            <!-- Cột 1 hàng 3: Role (Select) -->
                            <div class="col-12 col-md-6">
                              <label class="form-label">Role:</label>
                              <form:select class="form-select" path="role.name">
                                <form:option value="USER">User</form:option>
                                <form:option value="ADMIN">Admin</form:option>
                              </form:select>
                            </div>

                            <!-- Cột 2 hàng 3: Avatar -->
                            <div class="col-12 col-md-6">
                              <label for="avatarFile" class="form-label">Avatar:</label>
                              <input class="form-control" type="file" id="avatarFile" name="avatarFile"
                                accept=".png, .jpg, .jpeg">
                            </div>

                            <!-- Hàng 4: Address (chiếm trọn 12 cột) -->

                            <div class="col-12 mb-3">
                              <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview" />
                            </div>
                            <!-- Nút Submit -->
                            <div class="col-12 mt-4">
                              <button type="submit" class="btn btn-primary btn-lg w-100 fw-semibold">Submit</button>
                            </div>

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
        <script src="/js/scripts.js"></script>
      </body>

      </html>