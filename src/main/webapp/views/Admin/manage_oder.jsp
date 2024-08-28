<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Manage Oder</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="../css/qlsanpham.css" />
</head>
<body>
	<jsp:include page="Common/navigation.jsp" />

	<div class="container my-5">
		<div class="row">
			<jsp:include page="Common/sidebar.jsp" />
				<div class="cot2 col-12 col-md-10 mb-1 mt-2">
					<h2>Quản Lý Đơn Hàng</h2>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Mã Đơn Hàng</th>
								<th>Mã Khách Hàng</th>
								<th>Ngày Đặt Hàng</th>
								<th>Trạng Thái</th>
								<th>Tổng Tiền</th>
								<th>Hành Động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orders}">
								<tr>
									<td>${order.orderId}</td>
									<td>${order.customer.customerId}</td>
									<td>${order.orderDate}</td>
									<td>${order.status}</td>
									<td>${order.totalAmount}</td>
									<td>
										<form action="/orderAdmin/${order.orderId}" method="get">
											<button
											  type="submit"
											  class="btn btn-primary"
											>
											  Xem chi tiết
											</button>
										  </form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</div>

	<jsp:include page="Common/footer.jsp" />
</body>
</html>
