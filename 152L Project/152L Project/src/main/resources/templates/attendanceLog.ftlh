<!DOCTYPE html>
<html lang="en">
<head>
    <title>Attendance Log - Employee Management System</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Attendance Log Styles - Glass Morphism Theme */
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
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.15);
            --border-radius: 12px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
            line-height: 1.6;
        }

        .header {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            color: white;
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .header h1 {
            font-weight: 600;
            font-size: 1.8rem;
            margin: 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .main-content {
            padding: 2rem 0;
        }

        .content-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            margin: 0 auto;
            max-width: 1400px;
            box-shadow: var(--shadow-lg);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid rgba(52, 152, 219, 0.3);
        }

        .section-header h2 {
            color: var(--secondary-color);
            font-weight: 600;
            margin: 0;
            font-size: 2.2rem;
        }

        .add-btn {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 50px;
            padding: 0.8rem 2rem;
            color: white;
            font-weight: 600;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(52, 152, 219, 0.4);
            color: white;
        }

        /* Table Styles */
        .table-container {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin: 0;
        }

        .data-table thead {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
        }

        .data-table th {
            padding: 1.25rem 1rem;
            text-align: left;
            font-weight: 600;
            color: white;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .data-table tbody tr {
            border-bottom: 1px solid rgba(222, 226, 230, 0.5);
            transition: var(--transition);
        }

        .data-table tbody tr:hover {
            background: rgba(52, 152, 219, 0.08);
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .data-table td {
            padding: 1.25rem 1rem;
            color: var(--dark-color);
            vertical-align: middle;
        }

        /* Status Badges */
        .status-badge {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: 2px solid transparent;
        }

        .badge-present {
            background: linear-gradient(135deg, rgba(39, 174, 96, 0.15), rgba(39, 174, 96, 0.25));
            color: var(--success-color);
            border-color: rgba(39, 174, 96, 0.3);
        }

        .badge-absent {
            background: linear-gradient(135deg, rgba(231, 76, 60, 0.15), rgba(231, 76, 60, 0.25));
            color: var(--danger-color);
            border-color: rgba(231, 76, 60, 0.3);
        }

        .badge-late {
            background: linear-gradient(135deg, rgba(243, 156, 18, 0.15), rgba(243, 156, 18, 0.25));
            color: var(--warning-color);
            border-color: rgba(243, 156, 18, 0.3);
        }

        .badge-other {
            background: linear-gradient(135deg, rgba(108, 117, 125, 0.15), rgba(108, 117, 125, 0.25));
            color: #6c757d;
            border-color: rgba(108, 117, 125, 0.3);
        }

        /* Action Buttons */
        .actions {
            white-space: nowrap;
        }

        .action-btn {
            border-radius: 50px;
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            font-weight: 500;
            margin: 0 0.15rem;
            transition: var(--transition);
            border: 2px solid transparent;
            text-decoration: none;
            display: inline-block;
        }

        .btn-view {
            background: linear-gradient(135deg, var(--primary-color), #2980b9);
            color: white;
        }

        .btn-view:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
            color: white;
        }

        .btn-edit {
            background: linear-gradient(135deg, var(--warning-color), #e67e22);
            color: white;
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(243, 156, 18, 0.3);
            color: white;
        }

        .btn-delete {
            background: linear-gradient(135deg, var(--danger-color), #c0392b);
            color: white;
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(231, 76, 60, 0.3);
            color: white;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: #6c757d;
        }

        .empty-state td {
            padding: 3rem 1rem !important;
            font-style: italic;
        }

        .empty-icon {
            font-size: 4rem;
            opacity: 0.5;
            margin-bottom: 1rem;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: var(--shadow);
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #6c757d;
            font-weight: 500;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .footer {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content-card {
                padding: 1.5rem;
                margin: 1rem;
            }

            .section-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .add-btn {
                width: 100%;
                justify-content: center;
            }

            .table-container {
                overflow-x: auto;
            }

            .data-table {
                min-width: 800px;
            }

            .actions {
                white-space: normal;
            }

            .action-btn {
                display: block;
                width: 100%;
                margin: 0.25rem 0;
                text-align: center;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 1rem;
            }
        }

        @media (max-width: 480px) {
            .header h1 {
                font-size: 1.5rem;
            }

            .section-header h2 {
                font-size: 1.8rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .data-table th,
            .data-table td {
                padding: 0.75rem 0.5rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <h1>Employee Management System</h1>
        </div>
    </header>

    <div class="container main-content">
        <div class="content-card">
            <!-- Section Header -->
            <div class="section-header">
                <h2>
                    <i class="fas fa-clipboard-check me-2"></i>
                    Attendance Records
                </h2>
                <a href="/attendance/add" class="add-btn">
                    <i class="fas fa-plus"></i>
                    Record New Attendance
                </a>
            </div>

            <!-- Quick Stats -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-number">156</div>
                    <div class="stat-label">Total Records</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">92%</div>
                    <div class="stat-label">Present Today</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">5%</div>
                    <div class="stat-label">Late Arrivals</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">3%</div>
                    <div class="stat-label">Absent Today</div>
                </div>
            </div>

            <!-- Attendance Table -->
            <div class="table-container">
                <table class="data-table">
                    <thead>
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
                                <td><strong>#${record.id}</strong></td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="bg-primary rounded-circle d-flex align-items-center justify-content-center me-2"
                                             style="width: 35px; height: 35px; background: linear-gradient(135deg, var(--primary-color), var(--secondary-color)) !important;">
                                            <span class="text-white fw-bold" style="font-size: 0.8rem;">
                                                ${record.employee.name!''?substring(0,1)?upper_case}
                                            </span>
                                        </div>
                                        <div>
                                            <div class="fw-bold">${record.employee.name!''}</div>
                                            <small class="text-muted">${record.employee.department.name!''}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <i class="fas fa-calendar-alt me-2 text-primary"></i>
                                    ${record.date}
                                </td>
                                <td>
                                    <#if record.status == 'Present'>
                                        <span class="status-badge badge-present">
                                            <i class="fas fa-check-circle me-1"></i>
                                            Present
                                        </span>
                                    <#elseif record.status == 'Absent'>
                                        <span class="status-badge badge-absent">
                                            <i class="fas fa-times-circle me-1"></i>
                                            Absent
                                        </span>
                                    <#elseif record.status == 'Late'>
                                        <span class="status-badge badge-late">
                                            <i class="fas fa-clock me-1"></i>
                                            Late
                                        </span>
                                    <#else>
                                        <span class="status-badge badge-other">
                                            <i class="fas fa-question-circle me-1"></i>
                                            ${record.status}
                                        </span>
                                    </#if>
                                </td>
                                <td class="actions">
                                    <a href="/attendance/view/${record.id}" class="action-btn btn-view">
                                        <i class="fas fa-eye me-1"></i>View
                                    </a>
                                    <a href="/attendance/edit/${record.id}" class="action-btn btn-edit">
                                        <i class="fas fa-edit me-1"></i>Edit
                                    </a>
                                    <a href="/attendance/delete/${record.id}" class="action-btn btn-delete"
                                       onclick="return confirm('Are you sure you want to delete this attendance record?')">
                                        <i class="fas fa-trash me-1"></i>Delete
                                    </a>
                                </td>
                            </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="5" class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-clipboard-list"></i>
                                    </div>
                                    <h4>No Attendance Records Found</h4>
                                    <p class="mt-2">Start tracking attendance by adding your first record.</p>
                                    <a href="/attendance/add" class="add-btn mt-3" style="width: auto;">
                                        <i class="fas fa-plus"></i>
                                        Add First Record
                                    </a>
                                </td>
                            </tr>
                        </#if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2023 Employee Management System. All rights reserved.</p>
            <p>Streamlining workforce management for modern businesses</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>