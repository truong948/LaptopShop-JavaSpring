<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <meta name="description" content="" />
      <meta name="author" content="" />
      <title>Dashboard - SB Admin</title>
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
              <h1 class="mt-4">Product</h1>
              <div class="mb-4">product</div>

              <div class="d-flex justify-content-between align-items-center mb-3">
                <h2 class="mb-0">Table Users</h2>
                <a class="btn btn-primary" href="/admin/user/create">CREATE A USER</a>
              </div>

              <div class="card mb-4">
                <div class="card-body">
                  <table class="table table-bordered table-hover mb-0">
                    <thead>
                      <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Email</th>
                        <th scope="col">Full Name</th>
                        <th scope="col">Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="user" items="${users}">
                        <tr>
                          <th scope="row">${user.id}</th>
                          <td>${user.email}</td>
                          <td>${user.fullName}</td>
                          <td>
                            <a class="btn btn-success" href="/admin/user/${user.id}">View</a>
                            <a class="btn btn-warning" href="/admin/user/update/${user.id}">Update</a>
                            <a class="btn btn-danger" href="/admin/user/delete/${user.id}">Delete</a>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
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