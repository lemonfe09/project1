<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Categories</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../css/qlsanpham.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>
  <body>
    <%@include file="Common/navigation.jsp"%>

    <div class="container my-5">
      <div class="row">
        <%@include file="Common/sidebar.jsp"%>
        <div class="cot2 col-12 col-md-10 mb-1 mt-2">
          <h2>Quản Lý Danh Mục</h2>
          <button
            type="button"
            class="btn btn-primary mb-3"
            data-bs-toggle="modal"
            data-bs-target="#addCategoryModal"
          >
            Thêm Danh Mục Mới
          </button>
          <table class="table table-striped">
            <thead>
              <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Mô Tả</th>
                <th class="text-center">Hành Động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${categories}" var="category">
                <tr>
                  <td>${category.categoryId}</td>
                  <td>${category.name}</td>
                  <td>${category.description}</td>
                  <td>
                    <div
                      class="d-flex justify-content-center align-items-center"
                    >
                      <form
                        method="get"
                        data-bs-toggle="modal"
                        data-bs-target="#updateCategoryModal"
                        class="form-inline d-flex align-items-center"
                      >
                        <a
                          href="/categoryM/edit/${category.categoryId}"
                          class="btn btn-primary mx-1"
                          >Edit</a
                        >
                      </form>
                      <a
                        href="/categoryM/delete/${category.categoryId}"
                        onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
                        class="btn btn-danger"
                        >Xóa</a
                      >
                    </div>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <jsp:include page="Common/footer.jsp" />

    <div
      class="modal fade"
      id="addCategoryModal"
      tabindex="-1"
      aria-labelledby="addCategoryModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addCategoryModalLabel">
              Thêm Danh Mục Mới
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form
              action="/categoryM/add"
              method="post"
              modelAttribute="newCategory"
            >
              <div class="mb-3">
                <label for="categoryName" class="form-label">Tên</label>
                <input
                  type="text"
                  class="form-control"
                  id="categoryName"
                  name="name"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="categoryDescription" class="form-label"
                  >Mô Tả</label
                >
                <textarea
                  class="form-control"
                  id="categoryDescription"
                  name="description"
                  required
                ></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Thêm</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
