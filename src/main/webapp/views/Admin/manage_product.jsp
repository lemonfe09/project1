<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="../css/qlsanpham.css" />
  </head>
  <body>
    <jsp:include page="Common/navigation.jsp" />

    <div class="container my-5">
      <div class="row">
        <jsp:include page="Common/sidebar.jsp" />
        <div class="cot2 col-12 col-md-10 mb-1 mt-2">
          <h2>Quản Lý Sản Phẩm</h2>
          <button
            type="button"
            class="btn btn-primary mb-3"
            data-bs-toggle="modal"
            data-bs-target="#addProductModal"
          >
            Thêm Sản Phẩm Mới
          </button>
          <table class="table table-striped">
            <thead>
              <tr>
                <th>
                  <a
                    class="text-decoration-none text-dark"
                    href="/admin/product/productId?direction=${currentField == 'productId' && currentDirection == 'asc' ? 'desc' : 'asc'}"
                    >Id</a
                  >
                </th>
                <th>
                  <a
                    class="text-decoration-none text-dark"
                    href="/admin/product/name?direction=${currentField == 'name' && currentDirection == 'asc' ? 'desc' : 'asc'}"
                    >Tên</a
                  >
                </th>
                <th>
                  <a
                    class="text-decoration-none text-dark"
                    href="/admin/product/description?direction=${currentField == 'description' && currentDirection == 'asc' ? 'desc' : 'asc'}"
                    >Mô Tả</a
                  >
                </th>
                <th>
                  <a
                    class="text-decoration-none text-dark"
                    href="/admin/product/price?direction=${currentField == 'price' && currentDirection == 'asc' ? 'desc' : 'asc'}"
                    >Giá</a
                  >
                </th>
                <th>
                  <a
                    class="text-decoration-none text-dark"
                    href="/admin/product/stockQuantity?direction=${currentField == 'stockQuantity' && currentDirection == 'asc' ? 'desc' : 'asc'}"
                    >Số Lượng Tồn Kho</a
                  >
                </th>
                <th>
                  <a
                    class="text-decoration-none text-dark"
                    href="/admin/product/category.categoryId?direction=${currentField == 'category.categoryId' && currentDirection == 'asc' ? 'desc' : 'asc'}"
                    >Mã Danh Mục</a
                  >
                </th>
                <th>Hình Ảnh</th>
                <th>Hành Động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${products}" var="product">
                <tr>
                  <td>${product.productId}</td>
                  <td>${product.name}</td>
                  <td>${product.description}</td>
                  <td>${product.price} $</td>
                  <td>${product.stockQuantity}</td>
                  <td>${product.category.categoryId}</td>
                  <td>
                    <img
                      src="/images/${product.imageUrl}"
                      class="img-fluid product-thumbnail"
                      style="width: 100px; height: auto"
                    />
                  </td>
                  <td>
                    <div
                      class="d-flex justify-content-center align-items-center"
                    >
                      <form
                        action="/productM/edit/${product.productId}"
                        method="get"
                        class="form-inline d-flex align-items-center"
                      >
                        <button type="submit" class="btn btn-primary mx-1">
                          Edit
                        </button>
                      </form>
                      <form
                        method="get"
                        action="/productM/delete/${product.productId}"
                        class="form-inline"
                      >
                        <button type="submit" class="btn btn-danger">
                          Delete
                        </button>
                      </form>
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

    <!-- Modal -->
    <div
      class="modal fade"
      id="addProductModal"
      tabindex="-1"
      aria-labelledby="addProductModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addProductModalLabel">
              Thêm Sản Phẩm Mới
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form action="/productM/add" method="post">
              <div class="mb-3">
                <label for="productName" class="form-label">Tên</label>
                <input
                  type="text"
                  class="form-control"
                  id="productName"
                  name="name"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="productDescription" class="form-label">Mô Tả</label>
                <textarea
                  class="form-control"
                  id="productDescription"
                  name="description"
                  required
                ></textarea>
              </div>
              <div class="mb-3">
                <label for="productPrice" class="form-label">Giá</label>
                <input
                  type="number"
                  class="form-control"
                  id="productPrice"
                  name="price"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="stockQuantity" class="form-label"
                  >Số Lượng Tồn Kho</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="stockQuantity"
                  name="stockQuantity"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="categoryId" class="form-label">Danh Mục</label>
                <select
                  class="form-select"
                  id="categoryId"
                  name="categoryId"
                  required
                >
                  <c:forEach items="${category}" var="cat">
                    <option value="${cat.categoryId}">${cat.name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="mb-3">
                <label for="imageFile" class="form-label">Hình Ảnh</label>
                <input
                  type="file"
                  class="form-control"
                  id="imageFile"
                  name="imageUrl"
                  required
                />
              </div>
              <button type="submit" class="btn btn-primary">Thêm</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
