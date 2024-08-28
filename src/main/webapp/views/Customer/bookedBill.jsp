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
    <link rel="shortcut icon" href="favicon.png" />

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap4" />
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
    />
    <title>
      Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites
      by Untree.co
    </title>
  </head>

  <body>
    <!-- Start Header/Navigation -->
    <%@ include file="Common/navigation.jsp"%>
    <!-- End Header/Navigation -->

    <!-- Start Hero Section -->
    <div class="hero">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-lg-5">
            <div class="intro-excerpt">
              <h1>MY LIST OF BILL</h1>
            </div>
          </div>
          <div class="col-lg-7">
            <div class="hero-img-wrap">
              <img src="images/couch.png" class="img-fluid" />
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- End Hero Section -->
    <div class="container mt-5" style="padding-bottom: 100px">
      <h3 class="text-success font-italic">GET MORE FOR BETTER!</h3>

      <table class="table">
        <thead>
          <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Total Amount</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="order" items="${customerOrders}">
            <tr>
              <td>${order.orderId}</td>
              <td>${order.orderDate}</td>
              <td>${order.status}</td>
              <td>${order.totalAmount}</td>
              <td>
                <form action="/order/${order.orderId}/orderDetail" method="get">
                  <button type="submit" class="btn btn-primary">
                    Xem chi tiết
                  </button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- Start Footer Section -->
    <%@ include file="Common/footer.jsp"%>
    <!-- End Footer Section -->

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
  </body>
</html>
