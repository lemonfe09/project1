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
    <link
      rel="shortcut icon"
      href="${pageContext.request.contextPath}/favicon.png"
    />
    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap4" />
    <!-- Bootstrap CSS -->
    <link
      href="${pageContext.request.contextPath}/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/css/tiny-slider.css"
      rel="stylesheet"
    /><link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link
      href="${pageContext.request.contextPath}/css/style.css"
      rel="stylesheet"
    />

    <title>Product Detail - Furni Free Bootstrap 5 Template</title>
  </head>

  <style>
    .button-container {
      display: flex;
      justify-content: center; /* Căn button ở giữa */
      margin-bottom: 15px; /* Khoảng cách giữa button và ảnh */
    }

    .btn-prev,
    .btn-next {
      margin: 0 10px; /* Khoảng cách giữa hai button */
    }
  </style>
  <body>
    <!-- Start Header/Navigation -->
    <%@ include file="Common/navigation.jsp"%>
    <!-- End Header/Navigation -->

    <!-- Start Product Detail Section -->
    <div class="product-detail-section my-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="product-gallery">
              <img
                id="mainImage"
                src="${pageContext.request.contextPath}/images/${product.imageUrl}"
                class="img-fluid mb-4"
              />
              <div class="row">
                <div class="col-3">
                  <img
                    id="thumb1"
                    src="${pageContext.request.contextPath}/images/product-1.png"
                    class="img-fluid"
                    style="width: 100px"
                  />
                </div>
                <div class="col-3">
                  <img
                    id="thumb2"
                    src="${pageContext.request.contextPath}/images/product-2.png"
                    class="img-fluid"
                    style="width: 100px"
                  />
                </div>
                <div class="col-3">
                  <img
                    id="thumb3"
                    src="${pageContext.request.contextPath}/images/product-3.png"
                    class="img-fluid"
                    style="width: 100px"
                  />
                </div>
                <div class="col-3">
                  <img
                    id="thumb4"
                    src="${pageContext.request.contextPath}/images/product-1.png"
                    class="img-fluid"
                    style="width: 100px"
                  />
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="product-detail-content">
              <form
                action="/cart/add/${product.productId}"
                method="post"
                class="d-flex flex-column h-100"
              >
                <div class="product-item">
                  <h1 class="product-title text-center">${product.name}</h1>
                  <h2 class="product-price" style="color: red">
                    ${product.price} $
                  </h2>
                  <h4 class="product-description text-dark">
                    ${product.description}
                  </h4>
                  <p class="product-details">
                    Số lượng tồn : ${product.stockQuantity}
                  </p>
                  <input type="hidden" name="quantity" value="1" />
                  <button type="submit" class="btn btn-primary btn-block mt-3">
                    Add to Cart
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Product Detail Section -->

    <!-- Start Related Products Section -->
    <div class="related-products-section my-5">
      <div class="container">
        <h2 class="section-title pb-3">Sản phẩm liên quan</h2>
        <div class="row">
          <c:forEach var="product" items="${products}">
            <!-- Start Column 1 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
              <a
                class="product-item"
                href="${pageContext.request.contextPath}/product/detail/${product.productId}"
              >
                <img
                  src="${pageContext.request.contextPath}/images/${product.imageUrl}"
                  class="img-fluid product-thumbnail"
                  style="width: 150px"
                />
                <h3 class="product-title">${product.name}</h3>
                <strong class="product-price">${product.price} $</strong>
              </a>
            </div>
            <!-- End Column 1 -->
          </c:forEach>
        </div>
      </div>
    </div>
    <!-- End Related Products Section -->

    <!-- Start Footer Section -->
    <%@ include file="Common/footer.jsp"%>
    <!-- End Footer Section -->

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
  </body>
</html>
