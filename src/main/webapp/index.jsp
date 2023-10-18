<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CRUD Student</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-12 d-flex justify-content-center align-items-center">
      <form class="col-6">
        <div class="mb-3">
          <label for="" class="form-label-sm">Student code</label>
          <input type="email" class="form-control form-control-sm"  aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
          <label for="" class="form-label-sm">Name</label>
          <input type="email" class="form-control form-control-sm"  aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
          <label for="" class="form-label-sm">Year of Birth</label>
          <input type="email" class="form-control form-control-sm"  aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
          <label for="" class="form-label-sm">Phone number</label>
          <input type="email" class="form-control form-control-sm"  aria-describedby="emailHelp">
        </div>
        <div >
          <button type="submit" class="btn btn-success">Create</button>
          <button type="submit" class="btn btn-warning">Update</button>
          <button type="submit" class="btn btn-danger">Delete</button>
          <button type="submit" class="btn btn-primary">Reset</button>
        </div>

      </form>
    </div>

    <div class="container mt-3">
      <h2>Table Students</h2>
      <table class="table table-striped">
        <thead>
        <tr>
          <th>Student code</th>
          <th>Name</th>
          <th>Birth</th>
          <th>Phone</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>ST001</td>
          <td>Doe</td>
          <td>1996</td>
          <td>0988723233</td>
          <td>
            <a>Edit</a>
            <a>Delete</a>
          </td>
        </tr>
        <tr>
          <td>ST001</td>
          <td>Doe</td>
          <td>1996</td>
          <td>0988723233</td>
          <td>
            <a>Edit</a>
            <a>Delete</a>
          </td>
        </tr>
        <tr>
          <td>ST001</td>
          <td>Doe</td>
          <td>1996</td>
          <td>0988723233</td>
          <td>
            <a>Edit</a>
            <a>Delete</a>
          </td>
        </tr>

        </tbody>
      </table>
    </div>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>