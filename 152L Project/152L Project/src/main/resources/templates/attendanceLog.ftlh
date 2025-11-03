<!DOCTYPE html>
<html>
<head>
    <title>Attendance Log</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>
    <link rel="stylesheet" href="/styles/list.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Attendance Records</h2>

    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Employee</th>
                <th>Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <#if attendance?? && attendance?has_content>
                <#list attendance as record>
                <tr>
                    <td>${record.id}</td>
                    <td>${record.employee.name!''}</td>
                    <td>${record.date}</td>
                    <td>
                        <#if record.status == 'Present'>
                            <span class="badge bg-success">Present</span>
                        <#elseif record.status == 'Absent'>
                            <span class="badge bg-danger">Absent</span>
                        <#elseif record.status == 'Late'>
                            <span class="badge bg-warning">Late</span>
                        <#else>
                            <span class="badge bg-secondary">${record.status}</span>
                        </#if>
                    </td>
                    <td class="actions">
                        <a href="/attendance/view/${record.id}" class="btn btn-info btn-sm">View</a>
                        <a href="/attendance/edit/${record.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/attendance/delete/${record.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this attendance record?')">Delete</a>
                    </td>
                </tr>
                </#list>
            <#else>
                <tr><td colspan="5" class="text-center">No attendance records found.</td></tr>
            </#if>
        </tbody>
    </table>

    <br>
    <a href="/attendance/add" class="btn btn-primary">+ Record New Attendance</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>