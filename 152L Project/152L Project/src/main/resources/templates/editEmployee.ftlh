<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Edit Employee</h2>
    <form action="/employees/update/${employee.id}" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${employee.name}" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="${employee.email}" required>
        </div>
        <div class="mb-3">
            <label for="position" class="form-label">Position:</label>
            <input type="text" class="form-control" id="position" name="position" value="${employee.position}" required>
        </div>
        <div class="mb-3">
            <label for="department" class="form-label">Department:</label>
            <select class="form-select" id="department" name="department.id" required>
                <#list departments as dept>
                    <option value="${dept.id}" <#if dept.id == employee.department.id>selected</#if>>${dept.name}</option>
                </#list>
            </select>
        </div>
        <div class="mb-3">
            <label for="dateHired" class="form-label">Date Hired:</label>
            <input type="date" class="form-control" id="dateHired" name="dateHired" value="${employee.dateHired!}" required>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
        <a href="/employees/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
