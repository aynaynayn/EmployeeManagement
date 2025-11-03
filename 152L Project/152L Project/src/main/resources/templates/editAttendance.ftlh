<!DOCTYPE html>
<html>
<head>
    <title>Edit Attendance</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Edit Attendance</h2>
    <form action="/attendance/update/${attendance.id}" method="post">
        <div class="mb-3">
            <label for="employee" class="form-label">Employee:</label>
            <select class="form-select" id="employee" name="employee.id" required>
                <#list employees as emp>
                    <option value="${emp.id}" <#if emp.id == attendance.employee.id>selected</#if>>${emp.name}</option>
                </#list>
            </select>
        </div>
        <div class="mb-3">
            <label for="date" class="form-label">Date:</label>
            <input type="date" class="form-control" id="date" name="date" value="${attendance.date!}" required>

        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status:</label>
            <select class="form-select" id="status" name="status" required>
                <option value="Present" <#if attendance.status == "Present">selected</#if>>Present</option>
                <option value="Absent" <#if attendance.status == "Absent">selected</#if>>Absent</option>
                <option value="Late" <#if attendance.status == "Late">selected</#if>>Late</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
        <a href="/attendance/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
