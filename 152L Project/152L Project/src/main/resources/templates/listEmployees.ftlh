<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>
    <link rel="stylesheet" href="/styles/list.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Employees</h2>

    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Position</th>
                <th>Date Hired</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <#if employees?? && employees?has_content>
                <#list employees as emp>
                <tr>
                    <td>${emp.id}</td>
                    <td>${emp.name}</td>
                    <td>${emp.email}</td>
                    <td>${emp.department.name!''}</td>
                    <td>${emp.position}</td>
                    <td>${emp.dateHired}</td>
                    <td class="actions">
                        <a href="/employees/view/${emp.id}" class="btn btn-info btn-sm">View</a>
                        <a href="/employees/edit/${emp.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/employees/delete/${emp.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this employee?')">Delete</a>
                    </td>
                </tr>
                </#list>
            <#else>
                <tr><td colspan="7" class="text-center">No employees found.</td></tr>
            </#if>
        </tbody>
    </table>

    <br>
    <a href="/employees/add" class="btn btn-primary">+ Add New Employee</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>