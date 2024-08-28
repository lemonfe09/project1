<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<style>
  .cot1 {
    background: rgb(246, 246, 246);
  }
  .cot1 a {
    display: block;
    margin-bottom: 10px;
    color: green; /* Set text color to green */
    text-decoration: none; /* Remove underline */
  }
  .cot1 a:hover {
    color: darkgreen; /* Set hover color to darker green */
  }
</style>
<div class="cot1 col-md-2 col-12 mb-1 mr-0 p-3">
  <a href="/admin/index"> <i class="fa fa-home"></i> Trang Chủ </a>
  <a href="/admin/customers">
    <i class="fa fa-address-book"></i> Quản Lý Account
  </a>
  <a href="/admin/categoryM">
    <i class="fa fa-bookmark"></i> Quản Lý Danh Mục
  </a>
  <a href="/admin/order">
    <i class="fa fa-stack-overflow"></i> Quản Lý Đơn Hàng
  </a>
  <a href="/admin/product">
    <i class="fa fa-product-hunt"></i> Quản Lý Sản Phẩm
  </a>
  <a href="/admin/banners"> <i class="fa fa-unlock-alt"></i> Quản Lý Banner </a>
  <a href="/admin/logout"> <i class="fa fa-sign-out"></i> Thoát </a>
</div>
