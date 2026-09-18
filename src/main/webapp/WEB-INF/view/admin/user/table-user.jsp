<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Table Users</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
      </head>


      <body>
        <div>
          <div class="d-flex justify-content-between">
            <h1>Tables Users</h1>
            <BUTTON class="btn btn-primary" action="" method="GET"><a class="text-reset text-decoration-none"
                href="/admin/user/create">CREATE A USER</a></BUTTON>
          </div>
          <hr>
          <table class="table table-bordered table-hover">
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
                  <th>${user.id}</th>
                  <td>${user.email}</td>
                  <td>${user.fullName}</td>
                  <td><a class="btn btn-success" action="" method="" href="/admin/user/${user.id}">View</a>
                    <BUTTON class="btn btn-warning" action="" method=""><a href="/admin/user/create">Update</a></BUTTON>
                    <BUTTON class="btn btn-danger" action="" method=""><a href="/admin/user/create">Delete</a></BUTTON>
                  </td>

                </tr>
              </c:forEach>
              <!-- 
              <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>ThornSon</td>
                <td><BUTTON class="btn btn-success" action="" method=""><a
                      href="/admin/user/create">View</a></BUTTON><BUTTON class="btn btn-warning" action="" method=""><a
                      href="/admin/user/create">Update</a></BUTTON>
                  <BUTTON class="btn btn-danger" action="" method=""><a href="/admin/user/create">Delete</a></BUTTON>
                </td>
              </tr> -->
            </tbody>
          </table>
        </div>
      </body>

      </html>