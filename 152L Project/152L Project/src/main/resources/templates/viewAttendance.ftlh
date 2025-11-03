<!DOCTYPE html>
<html>
<head>
    <title>View Attendance Record</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .attendance-details { background-color: #f8f9fa; padding: 20px; border-radius: 8px; }
        .detail-row { margin-bottom: 15px; padding-bottom: 10px; border-bottom: 1px solid #dee2e6; }
        .detail-label { font-weight: bold; color: #495057; }
        .detail-value { color: #212529; }
        .status-badge { font-size: 0.9rem; }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Attendance Record Details</h2>
            <div>
                <a href="/attendance/list" class="btn btn-secondary">Back to List</a>
                <a href="/attendance/edit" class="btn btn-primary ms-2">Edit Attendance</a>
            </div>
        </div>

        <#if attendance??>
            <div class="attendance-details">
                <div class="row detail-row">
                    <div class="col-md-2 detail-label">ID:</div>
                    <div class="col-md-10 detail-value">${attendance.id}</div>
                </div>
                <div class="row detail-row">
                    <div class="col-md-2 detail-label">Employee:</div>
                    <div class="col-md-10 detail-value">${attendance.employee.name!''}</div>
                </div>
                <div class="row detail-row">
                    <div class="col-md-2 detail-label">Date:</div>
                    <div class="col-md-10 detail-value">${attendance.date}</div>
                </div>
                <div class="row detail-row">
                    <div class="col-md-2 detail-label">Status:</div>
                    <div class="col-md-10 detail-value">
                        <#if attendance.status == 'Present'>
                            <span class="badge bg-success status-badge">Present</span>
                        <#elseif attendance.status == 'Absent'>
                            <span class="badge bg-danger status-badge">Absent</span>
                        <#elseif attendance.status == 'Late'>
                            <span class="badge bg-warning status-badge">Late</span>
                        <#else>
                            <span class="badge bg-secondary status-badge">${attendance.status}</span>
                        </#if>
                    </div>
                </div>
                <#if attendance.employee??>
                    <div class="row detail-row">
                        <div class="col-md-2 detail-label">Employee Department:</div>
                        <div class="col-md-10 detail-value">${attendance.employee.department.name!''}</div>
                    </div>
                    <div class="row detail-row">
                        <div class="col-md-2 detail-label">Employee Position:</div>
                        <div class="col-md-10 detail-value">${attendance.employee.position!''}</div>
                    </div>
                </#if>
            </div>
        <#else>
            <div class="alert alert-warning mt-4">
                No attendance record found.
            </div>
        </#if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>