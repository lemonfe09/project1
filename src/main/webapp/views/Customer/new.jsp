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
    <title>Create New Customer</title>
  </head>
  <body>
    <%@ include file="Common/navigation.jsp"%>
    <div class="container mt-5" style="margin-bottom: 50px">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
          <div class="card shadow rounded">
            <div class="card-header text-center">
              <h3>Create New Customer</h3>
            </div>
            <div class="card-body">
              <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">${error}</div>
              </c:if>
              <form
                action="${pageContext.request.contextPath}/customer/new"
                method="post"
              >
                <div class="mb-3">
                  <label for="name" class="form-label">Full Name</label>
                  <input
                    type="text"
                    id="name"
                    name="name"
                    class="form-control"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="username" class="form-label">Username</label>
                  <input
                    type="text"
                    id="username"
                    name="username"
                    class="form-control"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    class="form-control"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Password</label>
                  <input
                    type="password"
                    id="password"
                    name="password"
                    class="form-control"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="phone" class="form-label">Phone</label>
                  <input
                    type="text"
                    id="phone"
                    name="phone"
                    class="form-control"
                  />
                </div>
                <div class="mb-3">
                  <label for="image" class="form-label">Image</label>
                  <input
                    type="file"
                    id="image"
                    name="image"
                    class="form-control"
                  />
                </div>
                <div class="d-grid gap-2 mt-4">
                  <button type="submit" class="btn btn-secondary btn-block">
                    Create
                  </button>
                </div>
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
