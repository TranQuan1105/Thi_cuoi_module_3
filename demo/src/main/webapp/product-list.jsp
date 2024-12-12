<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách sản phẩm</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center mb-4">Quản lý sản phẩm</h1>
  <a href="add-product.jsp" class="btn btn-primary mb-3">Thêm sản phẩm</a>
  <table class="table table-bordered table-striped">
    <thead class="table-primary">
    <tr>
      <th>STT</th>
      <th>Product Name</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Color</th>
      <th>Category</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${product}" varStatus="loop">
      <tr>
        <td><c:out value="${loop.count}"/></td>
        <td><c:out value="${p.name}"/></td>
        <td><c:out value="${p.price}"/></td>
        <td><c:out value="${p.quantity}"/></td>
        <td><c:out value="${p.color}"/></td>
        <td><c:out value="${p.category}"/></td>
        <td>
          <a class="btn btn-warning btn-sm">Edit</a>
          <a href="product?action=delete-product-form&id=${p.productId}" class="btn btn-danger btn-sm">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
