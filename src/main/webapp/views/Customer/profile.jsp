<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile - My Design Studio</title>
    <!-- Bootstrap CSS -->
    <link
      href="${pageContext.request.contextPath}/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/css/tiny-slider.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/css/style.css"
      rel="stylesheet"
    /><link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <!-- Start Header/Navigation -->
    <%@ include file="Common/navigation.jsp"%>
    <!-- End Header/Navigation -->

    <!-- Start Profile Section -->
    <div class="profile-section my-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 offset-lg-1">
            <div class="profile-img-wrap">
              <img
                src="${pageContext.request.contextPath}/images/${customer.image != null ? customer.image : 'person-1.jpg'}"
                class="img-fluid rounded-pill"
                alt="Profile Image"
                id="profileImage"
                name="image"
              />
            </div>
          </div>
          <div class="col-lg-6 offset-lg-1 mb-5">
            <form
              action="${pageContext.request.contextPath}/customer/profile/update"
              method="post"
              modelAttribute="customer"
            >
              <div class="profile-info">
                <h1 class="mb-4">Thông tin khách hàng</h1>
                <div class="mb-3">
                  <label for="customerId" class="form-label">Customer ID</label>
                  <input
                    type="text"
                    class="form-control"
                    id="customerId"
                    name="customerId"
                    value="${customer.customerId}"
                    readonly
                  />
                </div>
                <div class="mb-3">
                  <label for="name" class="form-label">Full Name</label>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    name="name"
                    value="${customer.name}"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="username" class="form-label">Username</label>
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    name="username"
                    value="${customer.username}"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    value="${customer.email}"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Password</label>
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    value="${customer.password}"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="phone" class="form-label">Phone</label>
                  <input
                    type="tel"
                    class="form-control"
                    id="phone"
                    name="phone"
                    value="${customer.phone}"
                    required
                  />
                </div>
              </div>
              <div>
                <button
                  type="button"
                  class="btn btn-primary"
                  id="wannaUpdateBtn"
                >
                  Tôi muốn sửa
                </button>
                <div id="updateSection" style="display: none">
                  <input type="file" id="image" name="image" class="mb-3" />
                  <button type="submit" class="btn btn-primary">
                    Chỉnh sửa
                  </button>
                </div>
                <a
                  href="${pageContext.request.contextPath}/order/${customer.customerId}"
                  class="btn btn-secondary"
                  >Đơn Hàng Đã Đặt</a
                >
                <a
                  href="${pageContext.request.contextPath}/customer/logout"
                  class="btn"
                  >Đăng xuất</a
                >
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- End Profile Section -->

    <!-- Start Footer Section -->
    <%@ include file="Common/footer.jsp"%>
    <!-- End Footer Section -->

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
    <script>
      function showSuccessMessage() {
        alert("Update Thành Công!!!");
      }
    </script>
    <script>
      window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get("success");
        if (successParam === "true") {
          showSuccessMessage();
        }
      };

      document.getElementById("wannaUpdateBtn").onclick = function () {
        document.getElementById("updateSection").style.display = "block";
        this.style.display = "none";
      };
    </script>
  </body>
</html>
