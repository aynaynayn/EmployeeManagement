<!DOCTYPE html>
<html>
<head>
    <title>Department List</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>
    <link rel="stylesheet" href="/styles/list.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Departments</h2>

    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Employee Count</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <#if departments?? && departments?has_content>
                <#list departments as dept>
                <tr>
                    <td>${dept.id}</td>
                    <td>${dept.name}</td>
                    <td>${dept.employees?size}</td>
                    <td class="actions">
                        <a href="/departments/view/${dept.id}" class="btn btn-info btn-sm">View</a>
                        <a href="/departments/edit/${dept.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/departments/delete/${dept.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this department?')">Delete</a>
                    </td>
                </tr>
                </#list>
            <#else>
                <tr><td colspan="4" class="text-center">No departments found.</td></tr>
            </#if>
        </tbody>
    </table>

    <br>
    <a href="/departments/add" class="btn btn-primary">+ Add New Department</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>