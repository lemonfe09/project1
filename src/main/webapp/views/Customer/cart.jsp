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
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
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
						<h1>My Cart</h1>
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
	<div class="container" style="margin-top: 150px;"><h3 class="text-success font-italic">TAKE FOR THE BETTER COMFORTABLE!</h3></div>
	<div class="container mt-5 pt-5">
        <c:if test="${not empty cartItems}">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
				<tbody>
					<c:forEach var="item" items="${cartItems}">
						<tr>
							<td class="align-middle">${item.name}</td>
							<td class="align-middle"><img src="/images/${item.image}" alt="${item.name}" width="80"></td>
							<td class="align-middle">${item.quantity}</td>
							<td class="align-middle">${item.price} $</td>
							<td class="align-middle">${item.price * item.quantity}</td>
							<td class="align-middle text-center">
								<div class="d-flex justify-content-center align-items-center">
									<form method="post" action="/cart/update/${item.id}" class="form-inline d-flex align-items-center">
										<input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control mr-2" />
										<button type="submit" class="btn btn-primary mx-1">Update</button>
									</form>
									<form method="post" action="/cart/remove/${item.id}" class="form-inline">
										<button type="submit" class="btn btn-danger">Remove</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
            </table>
            <div class="pt-3">
                <h4><strong>Total Amount: </strong> ${totalAmount} $</h4>
            </div>
			<div class="d-flex pb-3">
				<form method="post" action="/cart/clear">
					<button type="submit" class="btn btn-primary">Clear Cart</button>
				</form>
				<form method="post" action="/cart/buy">
					<button type="submit" class="btn btn-primary">Buy Now</button>
				</form>
			</div>
        </c:if>
        <c:if test="${empty cartItems}">
			<h3 class="text-warning mt-5">YOUR CART IS EMPTY NOW...</h3>
			<div class="col-auto mb-3">
				<button class="btn btn-primary">
					<a href="/product"> <span class="fa fa-shopping-cart text-white"></span></a>
				</button>
			  </div>
        </c:if>
    </div>

	<!-- Start Footer Section -->
	<%@ include file="Common/footer.jsp"%>
	<!-- End Footer Section -->

	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>
