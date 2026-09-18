<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Details</title>

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

              <div class="card">
                <div class="card-header bg-primary text-white text-center py-3">
                  <h4 class="mb-0 fw-bold">User Details with id=${id}</h4>
                </div>
                <div class="card" style="width: 18rem;">
                  <div class="card-header">
                    User Information
                  </div>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">${user.id}</li>
                    <li class="list-group-item">Email: -</li>
                    <li class="list-group-item">FullName: -</li>
                    <li class="list-group-item">Address: -</li>
                  </ul>
                </div>



              </div>
            </div>

          </div>
        </div>
        </div>
      </body>

      </html>