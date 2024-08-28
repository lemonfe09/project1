<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="author" content="Untree.co" />
    <link rel="shortcut icon" href="../favicon.png" />
    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap4" />
    <!-- Bootstrap CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
      rel="stylesheet"
    /><link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="../css/tiny-slider.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <title>
      Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites
      by Untree.co
    </title>
  </head>
  <body>
    <%@ include file="Common/navigation.jsp"%>
    <div class="container mt-5" style="margin-bottom: 50px">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
          <div class="card shadow rounded">
            <div class="card-header text-center">
              <h3>Đăng nhập</h3>
            </div>
            <div class="card-body">
              <form method="post" action="/customer/login">
                <div class="mb-3">
                  <label for="username" class="form-label">Tên đăng nhập</label>
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    name="username"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Mật khẩu</label>
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    required
                  />
                </div>
                <div class="d-grid gap-2 mt-4">
                  <button type="submit" class="btn btn-secondary btn-block">
                    Đăng nhập
                  </button>
                </div>
                <div class="text-center text-danger mt-1">
                  <h5>${error}</h5>
                </div>
                <a
                  href="${pageContext.request.contextPath}/customer/new"
                  class="d-block text-center my-2"
                  >Create New</a
                >
                <a href="#" class="d-block text-center">Quên mật khẩu?</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="Common/footer.jsp"%>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>
