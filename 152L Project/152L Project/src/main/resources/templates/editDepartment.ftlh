<!DOCTYPE html>
<html>
<head>
    <title>Edit Department</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Edit Department</h2>
    <form action="/departments/update/${department.id}" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Department Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${department.name}" required>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
        <a href="/departments/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
