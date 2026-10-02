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
        <title>Update Product</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
          $(document).ready(() => {
            const productFile = $("#productFile");
            productFile.change(function (e) {
              const file = e.target.files[0];
              if (!file) return;
              const imgURL = URL.createObjectURL(file);
              $("#productPreview").attr("src", imgURL);
              $("#productPreview").css({ "display": "block" });
            });

            const currentImage = "${newProduct.image}";
            if (currentImage && currentImage !== '') {
              $("#productPreview").attr("src", currentImage.startsWith('/') ? currentImage : '/images/product/' + currentImage);
              $("#productPreview").css({ "display": "block" });
            }
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
                <div class="container-fluid px-4">
                  <h1 class="mt-4">Update Product</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Update</li>
                  </ol>
                </div>

                <div class="container mt-5">
                  <div class="row justify-content-center">
                    <div class="col-12 col-md-8 col-lg-7">
                      <div class="card shadow-sm border-0">
                        <div class="card-header bg-primary text-white text-center py-3">
                          <h4 class="mb-0 fw-bold">Update A Product</h4>
                        </div>

                        <div class="card-body p-4 p-md-5">
                          <form:form action="/admin/product/update" method="post" modelAttribute="newProduct"
                            enctype="multipart/form-data">

                            <div class="mb-3" style="display:none;">
                              <label class="form-label fw-semibold">Id</label>
                              <form:input type="text" class="form-control form-control-lg" path="id" />
                              <form:hidden path="image" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Name</label>
                              <form:input type="text" class="form-control form-control-lg" path="name" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Price</label>
                              <form:input type="number" step="0.01" class="form-control form-control-lg" path="price" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Detail description</label>
                              <form:textarea class="form-control form-control-lg" path="detailDesc" rows="4" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Short description</label>
                              <form:input type="text" class="form-control form-control-lg" path="shortDesc" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Quantity</label>
                              <form:input type="number" class="form-control form-control-lg" path="quantity" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Sold</label>
                              <form:input type="number" class="form-control form-control-lg" path="sold" />
                            </div>

                            <div class="mb-3">
                              <label class="form-label fw-semibold">Factory</label>
                              <form:input type="text" class="form-control form-control-lg" path="factory" />
                            </div>

                            <div class="mb-4">
                              <label class="form-label fw-semibold">Target</label>
                              <form:input type="text" class="form-control form-control-lg" path="target" />
                            </div>

                            <div class="mb-4">
                              <label for="productFile" class="form-label fw-semibold">Product Image</label>
                              <input type="file" id="productFile" class="form-control form-control-lg"
                                name="hoidanitFile" accept=".png, .jpg, .jpeg" />
                            </div>

                            <div class="mb-4">
                              <img style="max-height: 250px; display: none;" alt="product preview"
                                id="productPreview" />
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