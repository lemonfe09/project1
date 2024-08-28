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
<link rel="shortcut icon" href="../favicon.png" />
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />
<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Furni Free Bootstrap 5 Template for Furniture and
	Interior Design Websites by Untree.co</title>
</head>
<!-- Start Header/Navigation -->
<%@ include file="Common/navigation.jsp"%>
<!-- End Header/Navigation -->

<!-- Start Hero Section -->
<div class="hero">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-lg-5">
				<div class="intro-excerpt">
					<h1>
						Change Think By <span class="d-block">My Design Studio</span>
					</h1>
					<p class="mb-4">Sofa da nhập khẩu từ các thương hiệu nội thất
						nổi tiếng trên thế giới đều hội tụ tại Sanggit và được phân phối
						độc quyền tại thị trường Việt Nam.</p>
					<p>
						<a href="" class="btn btn-secondary me-2">Mua ngay</a><a href="#"
							class="btn btn-white-outline">Khám phá</a>
					</p>
				</div>
			</div>
			<div class="col-lg-7">
				<div class="hero-img-wrap">
					<img src="${pageContext.request.contextPath}/images/couch.png" class="img-fluid" />
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Hero Section -->

<!-- Start Product Section -->
<div class="product-section">
	<div class="container">
		<div class="row">
			<!-- Start Column 1 -->
			<div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
				<h2 class="mb-4 section-title">Được tạo nên bởi những nguyên
					liệu tốt nhất.</h2>
				<p class="mb-4">Chúng là biểu tượng của sự thoải mái và phong
					cách. Mỗi đường may, mỗi đường nét và từng chi tiết được thiết kế
					tỉ mỉ để đảm bảo một trải nghiệm sang trọng cho bạn và những người
					thân yêu của bạn.</p>
				<p>
					<a href="/blog.jsp" class="btn">Khám phá</a>
				</p>
			</div>
			<!-- End Column 1 -->

			<!-- Start Column 2 -->
			<div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
				<a class="product-item" href="cart.jsp"> <img
					src="${pageContext.request.contextPath}/images/product-1.png" class="img-fluid product-thumbnail" />
					<h3 class="product-title">Ghế Nordic</h3> <strong
					class="product-price">$50.00</strong> <span class="icon-cross"><img
						src="${pageContext.request.contextPath}/images/cross.svg" class="img-fluid" /></span>
				</a>
			</div>
			<!-- End Column 2 -->

			<!-- Start Column 3 -->
			<div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
				<a class="product-item" href="cart.jsp"> <img
					src="${pageContext.request.contextPath}/images/product-2.png" class="img-fluid product-thumbnail" />
					<h3 class="product-title">Kruzo Ghế Aero</h3> <strong
					class="product-price">$78.00</strong> <span class="icon-cross"><img
						src="${pageContext.request.contextPath}/images/cross.svg" class="img-fluid" /></span>
				</a>
			</div>
			<!-- End Column 3 -->

			<!-- Start Column 4 -->
			<div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
				<a class="product-item" href="cart.jsp"> <img
					src="${pageContext.request.contextPath}/images/product-3.png" class="img-fluid product-thumbnail" />
					<h3 class="product-title">Ghế Ergonomic</h3> <strong
					class="product-price">$43.00</strong> <span class="icon-cross"><img
						src="${pageContext.request.contextPath}/images/cross.svg" class="img-fluid" /></span>
				</a>
			</div>
			<!-- End Column 4 -->
		</div>
	</div>
</div>
<!-- End Product Section -->

<!-- Start Why Choose Us Section -->
<%@ include file="Common/why-choose-us.jsp"%>
<!-- End Why Choose Us Section -->

<!-- Start Footer Section -->
<%@ include file="Common/footer.jsp"%>
<!-- End Footer Section -->

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>

</body>
</html>
