<!DOCTYPE html>
<html>
<head>
    <title>View Department</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .department-details { background-color: #f8f9fa; padding: 20px; border-radius: 8px; }
        .detail-row { margin-bottom: 15px; padding-bottom: 10px; border-bottom: 1px solid #dee2e6; }
        .detail-label { font-weight: bold; color: #495057; }
        .detail-value { color: #212529; }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Department Details</h2>
            <div>
                <a href="/departments/list" class="btn btn-secondary">Back to List</a>
                <a href="/departments/edit" class="btn btn-primary ms-2">Edit Department</a>
            </div>
        </div>

        <#if department??>
            <div class="department-details">
                <div class="row detail-row">
                    <div class="col-md-2 detail-label">ID:</div>
                    <div class="col-md-10 detail-value">${department.id}</div>
                </div>
                <div class="row detail-row">
                    <div class="col-md-2 detail-label">Name:</div>
                    <div class="col-md-10 detail-value">${department.name}</div>
                </div>
                <div class="row detail-row">
                    <div class="col-md-2 detail-label">Employee Count:</div>
                    <div class="col-md-10 detail-value">${department.employees?size}</div>
                </div>
            </div>

            <!-- Employees in Department Section -->
            <#if department.employees?? && department.employees?has_content>
                <div class="mt-4">
                    <h4>Employees in this Department</h4>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Email</th>
                                    <th>Date Hired</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#list department.employees as employee>
                                <tr>
                                    <td>${employee.name}</td>
                                    <td>${employee.position}</td>
                                    <td>${employee.email}</td>
                                    <td>${employee.dateHired}</td>
                                </tr>
                                </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </#if>
        <#else>
            <div class="alert alert-warning mt-4">
                No department data found.
            </div>
        </#if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>