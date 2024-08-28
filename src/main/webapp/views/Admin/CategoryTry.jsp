<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Manage Categories</title>
  </head>
  <body>
    <h1>Manage Categories</h1>

    <!-- Form for adding a category -->
    <h2>Add Category</h2>
    <form:form
      action="/categoryM/add"
      method="post"
      modelAttribute="newCategory"
    >
      <form:label path="name">Name:</form:label>
      <form:input path="name" required="true" />
      <br />
      <form:label path="description">Description:</form:label>
      <form:input path="description" />
      <br />
      <input type="submit" value="Add Category" />
    </form:form>

    <!-- Form for updating a category -->
    <h2>Update Category</h2>
    <form:form
      action="/categoryM/update"
      method="post"
      modelAttribute="category"
    >
      <form:hidden path="categoryId" />
      <form:label path="name">Name:</form:label>
      <form:input path="name" required="true" />
      <br />
      <form:label path="description">Description:</form:label>
      <form:input path="description" />
      <br />
      <input type="submit" value="Update Category" />
    </form:form>

    <!-- List of categories with edit and delete buttons -->
    <h2>Categories</h2>
    <table>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Actions</th>
      </tr>
      <c:forEach items="${categories}" var="category">
        <tr>
          <td>${category.name}</td>
          <td>${category.description}</td>
          <td>
            <form:form
              action="/categoryM/edit/${category.categoryId}"
              method="get"
            >
              <input type="submit" value="Edit" />
            </form:form>
            <a href="/categoryM/delete/${category.categoryId}">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </body>
</html>
