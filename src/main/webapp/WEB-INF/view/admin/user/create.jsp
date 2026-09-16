<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
      <!-- Latest compiled and minified CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- Latest compiled JavaScript -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
      <!-- <link href="/css/demo.css" rel="stylesheet"> -->

    </head>

    <body>

      <div class="container mt-5">
        <div class="row justify-content-center">
          <div class="col-12 col-md-8 col-lg-6">

            <div class="card shadow-sm">
              <div class="card-header bg-primary text-white text-center">
                <h4 class="mb-0">Create A User</h4>
              </div>

              <div class="card-body p-4">
                <form:form action="/admin/user/create1" method="post" modelAttribute="newUser">
                  <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <form:input type="email" class="form-control" name="email" required path="email" />
                  </div>

                  <div class="mb-3">
                    <label class="form-label">Password</label>
                    <form:input type="password" class="form-control" name="password" required path="password" />
                  </div>

                  <div class="mb-3">
                    <label class="form-label">Phone number</label>
                    <form:input type="text" class="form-control" name="phone" path="phone" />
                  </div>

                  <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <form:input type="text" class="form-control" name="fullName" path="fullname" />
                  </div>

                  <div class="mb-3">
                    <label class="form-label">Address</label>
                    <form:input type="text" class="form-control" name="address" path="address" />
                  </div>

                  <button type="submit" class="btn btn-primary w-100">Submit</button>
                </form:form>
              </div>
            </div>

          </div>

        </div>
      </div>
    </body>

    </html>