<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Customers</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="../css/qlsanpham.css" />
  </head>
  <body>
    <%@include file="Common/navigation.jsp"%>

    <div class="container my-5">
      <div class="row">
        <%@include file="Common/sidebar.jsp"%>
        <div class="cot2 col-12 col-md-10 mb-1 mt-2">
          <h2>Quản Lý Customers</h2>
          <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">Customer ID</th>
                <th scope="col">Name</th>
                <th scope="col">User</th>
                <th scope="col">Email</th>
                <th scope="col">Password</th>
                <th scope="col">Phone</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${customers}" var="customer">
                <tr>
                  <td>${customer.customerId}</td>
                  <td>${customer.name}</td>
                  <td>${customer.username}</td>
                  <td>${customer.email}</td>
                  <td>${customer.password}</td>
                  <td>${customer.phone}</td>
                  <td>
                    <a
                      href="editCustomer?id=${customer.customerId}"
                      class="btn btn-warning text-white btn-sm"
                      >Delete</a
                    >
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <%@include file="Common/footer.jsp"%>
  </body>
</html>
