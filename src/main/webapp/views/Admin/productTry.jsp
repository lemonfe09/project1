<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Manage Products</title>
  </head>
  <body>
    <style>
      img {
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 5px;
        width: 150px;
      }

      img:hover {
        box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
      }
    </style>
    <h1>Manage Products</h1>

    <!-- Form for updating a product -->
    <h2>Update Product</h2>
    <form:form action="/productM/update" method="post" modelAttribute="product">
      <form:hidden path="productId" />
      <form:label path="name">Name:</form:label>
      <form:input path="name" required="true" />
      <br />
      <form:label path="description">Description:</form:label>
      <form:input path="description" />
      <br />
      <form:label path="price">Price:</form:label>
      <form:input path="price" required="true" />
      <br />
      <form:label path="stockQuantity">Stock Quantity:</form:label>
      <form:input path="stockQuantity" required="true" />
      <br />
      <form:label path="imageUrl">Image URL:</form:label>
      <form:input path="imageUrl" />
      <br />
      <input type="submit" value="Update Product" />
    </form:form>
  </body>
</html>
