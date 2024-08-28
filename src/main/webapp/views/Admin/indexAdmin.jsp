<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
    <title>Manage WEBSITE</title>
  </head>
  <body>
    <!-- Navigation Bar Section 1 -->
    <jsp:include page="Common/navigation.jsp" />
    <!-- End of Navigation Bar Section 1 -->

    <div class="container container-md my-5">
      <div class="row">
        <!-- Sidebar Navigation -->
        <jsp:include page="Common/sidebar.jsp" />
        <!-- End of Sidebar Navigation -->

        <!-- Main Content Section -->
        <div class="cot2 col-12 col-md-10 mb-1 mt-2">
          <img
            src="${pageContext.request.contextPath}/images/adminBanner.png"
            width="800px"
          />
        </div>

        <!-- End of Modal Dialog -->
      </div>
    </div>

    <!-- Footer Section -->
    <jsp:include page="Common/footer.jsp" />
    <!-- End of Footer Section -->
  </body>
</html>
