<!DOCTYPE html>
<html>
<head>
    <title>View Employee - Employee Management System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* view.css - Professional Employee Management System Styles */

        /* Global Styles */
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --border-color: #dee2e6;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }

        /* Header Styles */
        .header {
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .header h1 {
            font-weight: 600;
            font-size: 2rem;
            margin: 0;
        }

        /* Main Content Styles */
        .main-content {
            padding: 2rem 0;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid var(--border-color);
        }

        .section-header h2 {
            color: var(--secondary-color);
            font-weight: 600;
            margin: 0;
            font-size: 1.5rem;
        }

        .section-subheader {
            margin-bottom: 1rem;
        }

        .section-subheader h4 {
            color: var(--secondary-color);
            font-weight: 500;
            border-left: 4px solid var(--primary-color);
            padding-left: 0.75rem;
        }

        .action-buttons .btn {
            border-radius: 50px;
            padding: 0.5rem 1.25rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .action-buttons .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .action-buttons .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .action-buttons .btn-outline-secondary {
            border-color: var(--border-color);
            color: #6c757d;
        }

        .action-buttons .btn-outline-secondary:hover {
            background-color: #f8f9fa;
            color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        /* Details Card Styles */
        .details-card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .detail-row {
            display: flex;
            padding: 0.75rem 0;
            border-bottom: 1px solid var(--border-color);
            align-items: center;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 600;
            color: var(--secondary-color);
            width: 200px;
            flex-shrink: 0;
        }

        .detail-value {
            color: var(--dark-color);
            flex-grow: 1;
        }

        /* Table Styles */
        .table-container {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin: 0;
        }

        .data-table thead {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            color: white;
        }

        .data-table th {
            padding: 1rem;
            text-align: left;
            font-weight: 600;
        }

        .data-table tbody tr {
            border-bottom: 1px solid var(--border-color);
            transition: background-color 0.2s ease;
        }

        .data-table tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
        }

        .data-table td {
            padding: 1rem;
        }

        /* Status Badges */
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-present {
            background-color: rgba(39, 174, 96, 0.15);
            color: var(--success-color);
            border: 1px solid rgba(39, 174, 96, 0.3);
        }

        .status-absent {
            background-color: rgba(231, 76, 60, 0.15);
            color: var(--danger-color);
            border: 1px solid rgba(231, 76, 60, 0.3);
        }

        .status-late {
            background-color: rgba(243, 156, 18, 0.15);
            color: var(--warning-color);
            border: 1px solid rgba(243, 156, 18, 0.3);
        }

        .status-other {
            background-color: rgba(108, 117, 125, 0.15);
            color: #6c757d;
            border: 1px solid rgba(108, 117, 125, 0.3);
        }

        /* Alert Styles */
        .alert {
            border-radius: var(--border-radius);
            border: none;
            padding: 1rem 1.5rem;
            box-shadow: var(--shadow);
        }

        .alert-warning {
            background-color: rgba(243, 156, 18, 0.15);
            color: #856404;
        }

        /* Footer Styles */
        .footer {
            background-color: var(--secondary-color);
            color: white;
            margin-top: 2rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .section-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .action-buttons {
                margin-top: 1rem;
                width: 100%;
            }

            .action-buttons .btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }

            .detail-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .detail-label {
                width: 100%;
                margin-bottom: 0.25rem;
            }

            .table-container {
                overflow-x: auto;
            }

            .data-table {
                min-width: 600px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container py-3">
            <h1>Employee Management System</h1>
        </div>
    </header>

    <div class="container main-content">
        <div class="section-header">
            <h2>Employee Details</h2>
            <div class="action-buttons">
                <a href="/employees/list" class="btn btn-outline-secondary">Back to List</a>
                <a href="/employees/edit" class="btn btn-primary ms-2">Edit Employee</a>
            </div>
        </div>

        <#if employee??>
            <div class="details-card">
                <div class="detail-row">
                    <div class="detail-label">ID:</div>
                    <div class="detail-value">${employee.id}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Name:</div>
                    <div class="detail-value">${employee.name}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Email:</div>
                    <div class="detail-value">${employee.email}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Position:</div>
                    <div class="detail-value">${employee.position}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Department:</div>
                    <div class="detail-value">${employee.department.name!''}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Date Hired:</div>
                    <div class="detail-value">${employee.dateHired}</div>
                </div>
            </div>

            <!-- Attendance Records Section -->
            <#if employee.attendanceRecords?? && employee.attendanceRecords?has_content>
                <div class="section-subheader">
                    <h4>Attendance Records</h4>
                </div>
                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#list employee.attendanceRecords as attendance>
                            <tr>
                                <td>${attendance.date}</td>
                                <td>
                                    <#if attendance.status == 'Present'>
                                        <span class="status-badge status-present">Present</span>
                                    <#elseif attendance.status == 'Absent'>
                                        <span class="status-badge status-absent">Absent</span>
                                    <#elseif attendance.status == 'Late'>
                                        <span class="status-badge status-late">Late</span>
                                    <#else>
                                        <span class="status-badge status-other">${attendance.status}</span>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
            </#if>
        <#else>
            <div class="alert alert-warning">
                No employee data found.
            </div>
        </#if>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container text-center py-3">
            <p class="mb-0">&copy; 2023 Employee Management System. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>