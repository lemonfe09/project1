<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Logout</title>
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
				<h2>Đã thoát</h2>
				<p>Bạn đã đăng xuất thành công.</p>
			</div>
		</div>
	</div>
	<jsp:include page="Common/footer.jsp" />
</body>
</html>
