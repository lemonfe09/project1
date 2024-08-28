<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/tiny-slider.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />
<title>Furni Free Bootstrap 5 Template for Furniture and
	Interior Design Websites by Untree.co</title>
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
						<h1>Products</h1>
						<p class="mb-4">Các sản phẩm tuyệt vời đến từ Sanggit. Shop,
							nơi bạn có thể thoải mái hết cỡ với chính những thứ nhỏ nhặt
							trong ngôi nhà thân yêu của mình.</p>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="hero-img-wrap">
						<img src="${pageContext.request.contextPath}/images/couch.png"
							class="img-fluid" />
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container pt-5">
		<div class="row">
			<div class="d-flex">
				<form action="/product/filter/category" method="post"
					class="row g-3">
					<div class="col-auto">
						<input name="cat" onchange="this.form.submit()"
							value="${param.cat}" class="form-control" placeholder="Loại hàng" />
					</div>
				</form>

				<div class="px-3">
					<div class="col-auto">
						<a class="btn" href="/product/top10">Top - 10</a>
						</button>
					</div>
				</div>
				<div class="col-lg-8">
					<form action="/product/filter/name" method="post" class="row g-3">
						<div class="col-auto">
							<input name="name" onchange="this.form.submit()"
								value="${param.name}" class="form-control"
								placeholder="Search products" />
						</div>
						<div class="col-auto">
							<button class="btn btn-primary">
								<span class="fa fa-search"></span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- End Hero Section -->

	<div class="product-section">
		<div class="container">
			<div class="row">
				<c:forEach var="product" items="${products}">
					<c:if test="${product.stockQuantity != 0}">
						<div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0 pt-4">
							<form action="/cart/add/${product.productId}" method="post"
								class="d-flex flex-column h-100">
								<div class="product-item">
									<a href="/product/detail/${product.productId}"> <img
										src="/images/${product.imageUrl}"
										class="img-fluid product-thumbnail" />
										<h3 class="product-title">${product.name}</h3> <strong
										class="product-price">$${product.price}</strong>
									</a>
									<div class="d-flex justify-content-center">
										<input type="hidden" name="quantity" value="1">
										<button type="submit" class="btn btn-primary btn-block mt-3">Add
											to Cart</button>
									</div>
								</div>
							</form>
						</div>
					</c:if>
				</c:forEach>

				<c:if test="${not empty pages}">
					<div class="my-3">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item ${pages.first ? 'disabled' : ''}"><a
									class="page-link" href="/product?page=${pages.number - 1}"
									tabindex="-1">Previous</a></li>
								<c:forEach var="i" begin="0" end="${pages.totalPages - 1}">
									<li class="page-item ${i == pages.number ? 'active' : ''}">
										<a class="page-link" href="/product?page=${i}">${i + 1}</a>
									</li>
								</c:forEach>
								<li class="page-item ${pages.last ? 'disabled' : ''}"><a
									class="page-link" href="/product?page=${pages.number + 1}">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<!-- Start Footer Section -->
	<%@ include file="Common/footer.jsp"%>
	<!-- End Footer Section -->

	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>

</body>
</html>
