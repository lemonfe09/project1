<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Manage Banners</title>
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
				<h2>Quản Lý Banner</h2>
				<button type="button" class="btn btn-primary mb-3"
					data-bs-toggle="modal" data-bs-target="#addBannerModal">Thêm
					Banner Mới</button>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>STT</th>
							<th>Hình Ảnh</th>
							<th>Tiêu Đề</th>
							<th>Thao Tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="banner" items="${banners}">
							<tr>
								<td>${banner.id}</td>
								<td><img src="${banner.image}" alt="${banner.title}"
									style="height: 100px;"></td>
								<td>${banner.title}</td>
								<td>
									<button type="button" class="btn btn-warning">Sửa</button>
									<button type="button" class="btn btn-danger">Xóa</button>
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
	<div class="modal fade" id="addBannerModal" tabindex="-1"
		aria-labelledby="addBannerModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addBannerModalLabel">Thêm Banner
						Mới</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="add_banner" method="post">
						<div class="mb-3">
							<label for="bannerTitle" class="form-label">Tiêu Đề</label> <input
								type="text" class="form-control" id="bannerTitle"
								name="bannerTitle" required>
						</div>
						<div class="mb-3">
							<label for="bannerImage" class="form-label">Hình Ảnh</label> <input
								type="text" class="form-control" id="bannerImage"
								name="bannerImage" required>
						</div>
						<button type="submit" class="btn btn-primary">Thêm</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
