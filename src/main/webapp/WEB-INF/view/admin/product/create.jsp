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
        <title>Create Product</title>
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
              <div class="container-fluid px-4 py-4">
                <h1 class="display-5 fw-bold mb-4">Create a product</h1>
                <hr class="mb-4" />

                <form action="/admin/product/create" method="post" enctype="multipart/form-data" class="row g-4">
                  <div class="col-md-6">
                    <label for="name" class="form-label fs-4 mb-2">
                      <span class="bg-primary text-white px-2 py-1 rounded">Name:</span>
                    </label>
                    <input type="text" id="name" name="name" class="form-control form-control-lg" />
                  </div>

                  <div class="col-md-6">
                    <label for="price" class="form-label fs-4 mb-2">Price:</label>
                    <input type="number" id="price" name="price" value="0.0" class="form-control form-control-lg" />
                  </div>

                  <div class="col-12">
                    <label for="detailDescription" class="form-label fs-4 mb-2">Detail description:</label>
                    <textarea id="detailDescription" name="detailDescription" class="form-control form-control-lg"
                      rows="4"></textarea>
                  </div>

                  <div class="col-md-6">
                    <label for="shortDescription" class="form-label fs-4 mb-2">Short description:</label>
                    <input type="text" id="shortDescription" name="shortDescription"
                      class="form-control form-control-lg" />
                  </div>

                  <div class="col-md-6">
                    <label for="quantity" class="form-label fs-4 mb-2">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="0" class="form-control form-control-lg" />
                  </div>

                  <div class="col-md-6">
                    <label for="factory" class="form-label fs-4 mb-2">Factory:</label>
                    <select id="factory" name="factory" class="form-select form-select-lg">
                      <option selected>Apple (MacBook)</option>
                      <option>Asus</option>
                      <option>Acer</option>
                      <option>LG</option>
                      <option>Dell</option>
                      <option>Lenovo</option>

                    </select>
                  </div>

                  <div class="col-md-6">
                    <label for="target" class="form-label fs-4 mb-2">Target:</label>
                    <select id="target" name="target" class="form-select form-select-lg">
                      <option selected>Gaming</option>
                      <option>Sinh viên - Văn phòng</option>
                      <option>Mỏng nhẹ</option>
                      <option>Doanh nhân</option>
                      <option>Thiết kế đề họa</option>
                    </select>
                  </div>

                  <div class="col-12">
                    <label for="image" class="form-label fs-4 mb-2">Image:</label>
                    <div class="d-flex align-items-center gap-3">
                      <label for="image" class="btn btn-light border border-secondary-subtle px-4 py-3 fs-5">Choose
                        File</label>
                      <input type="file" id="image" name="image" class="d-none" />
                      <span class="text-secondary fs-5">No fil...hosen</span>
                    </div>
                  </div>

                  <div class="col-12 mt-3">
                    <button type="submit" class="btn btn-primary px-4 py-2 fs-5">Create</button>
                  </div>
                </form>
              </div>
            </main>
          </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
      </body>

      </html>