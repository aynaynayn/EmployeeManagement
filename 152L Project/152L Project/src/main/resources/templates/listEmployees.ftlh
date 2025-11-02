<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>  <!-- external stylesheet -->
    <link rel="stylesheet" href="/styles/list.css"/>
</head>

<body>
<h2>Employees</h2>

<table>
    <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Department</th><th>Position</th><th>Date Hired</th><th>Actions</th>
    </tr>
    <#if employees?has_content>
        <#list employees as emp>
        <tr>
            <td>${emp.id}</td>
            <td>${emp.name}</td>
            <td>${emp.email}</td>
            <td>${emp.department}</td>
            <td>${emp.position}</td>
            <td>${emp.dateHired}</td>
            <td class="actions">
                <a href="/employees/view/${emp.id}">View</a> |
                <a href="/employees/edit/${emp.id}">Edit</a> |
                <a href="/employees/delete/${emp.id}">Delete</a>
            </td>
        </tr>
        </#list>
    <#else>
        <tr><td colspan="7">No employees found.</td></tr>
    </#if>
</table>

<br>
<a class="btn-add" href="/employees/add">+ Add New Employee</a>

</body>
</html>
