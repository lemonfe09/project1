<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<link
  href="${pageContext.request.contextPath}/css/bootstrap.min.css"
  rel="stylesheet"
/>
<link
  href="${pageContext.request.contextPath}/css/tiny-slider.css"
  rel="stylesheet"
/>
<link
  href="${pageContext.request.contextPath}/css/style.css"
  rel="stylesheet"
/>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<nav
  class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark"
  arial-label="Furni navigation bar"
>
  <div class="container">
    <a class="navbar-brand" href="/home">Sanggit<span>.</span></a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarsFurni"
      aria-controls="navbarsFurni"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsFurni">
      <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
        <li class="nav-item active">
          <a class="nav-link" href="home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/product">Sản phẩm</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/about">Thông tin</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/services">Dịch vụ</a>
        </li>
        <li class="nav-item"><a class="nav-link" href="/blog">Blog</a></li>
        <li class="nav-item">
          <a class="nav-link" href="/contact">Liên hệ</a>
        </li>
      </ul>
      <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
        <li class="nav-item">
          <a class="nav-link" href="/login"
            ><img src="${pageContext.request.contextPath}/images/user.svg"
          /></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/cart"
            ><img src="${pageContext.request.contextPath}/images/cart.svg"
          /></a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
