<%--
  Created by IntelliJ IDEA.
  User: hoanganhvu
  Date: 19/10/2023
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hoanganhvu
  Date: 18/10/2023
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CRUD User</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<body>
<%--navbar--%>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="https://th.bing.com/th/id/OIP.nFn_mpOrmv-KNugzesNztwHaHa?w=176&h=180&c=7&r=0&o=5&dpr=2&pid=1.7" alt="Bootstrap" width="30" height="24">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/student/index">List Student</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/index">List User</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Customer 2
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Customer 3</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<%--End Nav--%>
<h1>User Manager</h1>
<div class="alert">
  <c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
  </c:if>
  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>

</div>
<div class="container">
  <div class="row">
    <div class="col-12 d-flex justify-content-center align-items-center">
      <form class="col-6" action="/user/index" method="post">

        <div class="input-group mb-3 input-group-sm">
          <span class="input-group-text" id="input-group-sizing-default">Username</span>
          <input name="id" value="${user.id}" type="text" class="form-control" >
        </div>

        <div class="input-group mb-3 input-group-sm">
          <span class="input-group-text" >Password</span>
          <input name="password" value="${user.password}" type="password" class="form-control">
        </div>

        <div class="input-group mb-3 input-group-sm">
          <span class="input-group-text" >Fullname</span>
          <input name="fullname" value="${user.fullname}" type="text" class="form-control">
        </div>

        <div class="input-group mb-3 input-group-sm">
          <span class="input-group-text">Email</span>
          <input name="email" value="${user.email}" type="email" class="form-control">
        </div>
        <div class="div_role">
          <label>Role:</label>
          <input type="radio" id="admin" name="admin" ${user.admin?'checked':''}
          aria-label="Sizing example input">
          <label for="admin">Admin</label>
          <input type="radio" id="user" name="user" ${user.admin?'checked':''}
                 aria-label="Sizing example input">
          <label for="user">User</label>
        </div>



        <div >
          <button formaction="/user/create"  class="btn btn-success">Create</button>
          <button formaction="/user/update"  class="btn btn-warning">Update</button>
          <button formaction="/user/delete"  class="btn btn-danger">Delete</button>
          <button formaction="/user/reset"  class="btn btn-primary">Reset</button>
        </div>

      </form>
    </div>

    <div class="container mt-3">
      <h2>Table User</h2>
      <table class="table table-striped">
        <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Password</th>
          <th scope="col">Name</th>
          <th scope="col">Email</th>
          <th scope="col">Role</th>
          <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
          <tr>
            <td>${user.id}</td>
            <td>${user.password}</td>
            <td>${user.fullname}</td>
            <td>${user.email}</td>
            <td>${user.admin ?'Admin':'User'}</td>
            <td>
              <a href="/user/edit/?id=${user.id}">Edit</a>
              <a class="delete" href="/user/delete/?id=${user.id}">Delete</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>

