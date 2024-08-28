<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Product</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>
  <body>
    <jsp:include page="Common/navigation.jsp" />

    <div class="container my-5">
      <div class="row">
        <jsp:include page="Common/sidebar.jsp" />
        <div class="col-12 col-md-10 mb-1 mt-2">
          <h2>Cập Nhật Sản Phẩm</h2>

          <form:form
            action="/categoryM/update"
            method="post"
            modelAttribute="category"
            class="mt-4"
          >
            <form:hidden path="categoryId" />

            <div class="mb-3">
              <label for="name" class="form-label">Name:</label>
              <form:input
                path="name"
                id="name"
                class="form-control"
                required="true"
              />
            </div>

            <div class="mb-3">
              <label for="description" class="form-label">Description:</label>
              <form:input
                path="description"
                id="description"
                class="form-control"
              />
            </div>

            <button type="submit" class="btn btn-primary">
              Update Product
            </button>
          </form:form>
        </div>
      </div>
    </div>

    <jsp:include page="Common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>