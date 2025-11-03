<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Attendance - Employee Management System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>

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
            max-width: 1200px;
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

        .action-buttons .btn {
            border-radius: 50px;
            padding: 0.8rem 1.5rem;
            font-weight: 600;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            border: 2px solid transparent;
        }

        .btn-outline-secondary {
            background: transparent;
            border-color: var(--secondary-color);
            color: var(--secondary-color);
        }

        .btn-outline-secondary:hover {
            background: var(--secondary-color);
            color: white;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(52, 152, 219, 0.4);
            color: white;
        }

        /* Attendance Details Card */
        .details-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: var(--transition);
        }

        .details-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .detail-row {
            display: flex;
            padding: 1.25rem 0;
            border-bottom: 1px solid rgba(222, 226, 230, 0.5);
            align-items: center;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 600;
            color: var(--secondary-color);
            width: 220px;
            flex-shrink: 0;
            font-size: 1.1rem;
        }

        .detail-value {
            color: var(--dark-color);
            flex-grow: 1;
            font-size: 1.1rem;
        }

        .attendance-id {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            font-size: 1.2rem;
        }

        .employee-info-card {
            background: linear-gradient(135deg, rgba(52, 152, 219, 0.05), rgba(41, 128, 185, 0.1));
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin-top: 1rem;
            border-left: 4px solid var(--primary-color);
        }

        .employee-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .employee-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 1.5rem;
            margin-right: 1.5rem;
        }

        .employee-details {
            flex-grow: 1;
        }

        .employee-name {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 0.25rem;
        }

        .employee-position {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.1rem;
        }

        .employee-department {
            background: linear-gradient(135deg, var(--success-color), #229954);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 600;
        }

        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: 2px solid transparent;
            gap: 0.5rem;
        }

        .status-present {
            background: linear-gradient(135deg, rgba(39, 174, 96, 0.15), rgba(39, 174, 96, 0.25));
            color: var(--success-color);
            border-color: rgba(39, 174, 96, 0.3);
        }

        .status-absent {
            background: linear-gradient(135deg, rgba(231, 76, 60, 0.15), rgba(231, 76, 60, 0.25));
            color: var(--danger-color);
            border-color: rgba(231, 76, 60, 0.3);
        }

        .status-late {
            background: linear-gradient(135deg, rgba(243, 156, 18, 0.15), rgba(243, 156, 18, 0.25));
            color: var(--warning-color);
            border-color: rgba(243, 156, 18, 0.3);
        }

        .status-other {
            background: linear-gradient(135deg, rgba(108, 117, 125, 0.15), rgba(108, 117, 125, 0.25));
            color: #6c757d;
            border-color: rgba(108, 117, 125, 0.3);
        }

        /* Date Styling */
        .attendance-date {
            background: linear-gradient(135deg, #9b59b6, #8e44ad);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            font-size: 1.2rem;
        }

        /* Alert Styles */
        .alert {
            border-radius: var(--border-radius);
            border: none;
            padding: 1.5rem 2rem;
            box-shadow: var(--shadow);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
        }

        .alert-warning {
            background: linear-gradient(135deg, rgba(243, 156, 18, 0.1), rgba(243, 156, 18, 0.2));
            color: #856404;
            border-left: 4px solid var(--warning-color);
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

            .action-buttons {
                width: 100%;
            }

            .action-buttons .btn {
                width: 100%;
                justify-content: center;
                margin-bottom: 0.5rem;
            }

            .detail-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .detail-label {
                width: 100%;
                margin-bottom: 0.5rem;
            }

            .employee-header {
                flex-direction: column;
                text-align: center;
            }

            .employee-avatar {
                margin-right: 0;
                margin-bottom: 1rem;
            }

            .status-badge {
                padding: 0.6rem 1.2rem;
                font-size: 0.9rem;
            }
        }

        @media (max-width: 480px) {
            .header h1 {
                font-size: 1.5rem;
            }

            .section-header h2 {
                font-size: 1.8rem;
            }

            .details-card {
                padding: 1.5rem;
            }

            .employee-avatar {
                width: 50px;
                height: 50px;
                font-size: 1.2rem;
            }

            .employee-name {
                font-size: 1.2rem;
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
                    Attendance Record Details
                </h2>
                <div class="action-buttons">
                    <a href="/attendance/list" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i>
                        Back to List
                    </a>
                    <a href="/attendance/edit" class="btn btn-primary ms-2">
                        <i class="fas fa-edit me-1"></i>
                        Edit Attendance
                    </a>
                </div>
            </div>

            <#if attendance??>
                <!-- Attendance Details Card -->
                <div class="details-card">
                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="fas fa-id-card me-2"></i>
                            Attendance ID:
                        </div>
                        <div class="detail-value attendance-id">#${attendance.id}</div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="fas fa-user me-2"></i>
                            Employee:
                        </div>
                        <div class="detail-value">
                            <#if attendance.employee??>
                                ${attendance.employee.name!''}
                            <#else>
                                <span class="text-muted">No employee assigned</span>
                            </#if>
                        </div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="fas fa-calendar-day me-2"></i>
                            Date:
                        </div>
                        <div class="detail-value attendance-date">
                            <i class="fas fa-calendar-alt me-2"></i>
                            ${attendance.date}
                        </div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="fas fa-user-clock me-2"></i>
                            Status:
                        </div>
                        <div class="detail-value">
                            <#if attendance.status == 'Present'>
                                <span class="status-badge status-present">
                                    <i class="fas fa-check-circle"></i>
                                    Present
                                </span>
                            <#elseif attendance.status == 'Absent'>
                                <span class="status-badge status-absent">
                                    <i class="fas fa-times-circle"></i>
                                    Absent
                                </span>
                            <#elseif attendance.status == 'Late'>
                                <span class="status-badge status-late">
                                    <i class="fas fa-clock"></i>
                                    Late
                                </span>
                            <#else>
                                <span class="status-badge status-other">
                                    <i class="fas fa-question-circle"></i>
                                    ${attendance.status}
                                </span>
                            </#if>
                        </div>
                    </div>
                </div>

                <!-- Employee Information Card -->
                <#if attendance.employee??>
                    <div class="employee-info-card">
                        <div class="employee-header">
                            <div class="employee-avatar">
                                ${attendance.employee.name!''?substring(0,1)?upper_case}
                            </div>
                            <div class="employee-details">
                                <div class="employee-name">${attendance.employee.name!''}</div>
                                <div class="employee-position">
                                    <i class="fas fa-briefcase me-1"></i>
                                    ${attendance.employee.position!''}
                                </div>
                            </div>
                        </div>

                        <div class="detail-row" style="border-bottom: none; padding: 0.5rem 0;">
                            <div class="detail-label">
                                <i class="fas fa-building me-2"></i>
                                Department:
                            </div>
                            <div class="detail-value employee-department">
                                ${attendance.employee.department.name!''}
                            </div>
                        </div>

                        <#if attendance.employee.email??>
                        <div class="detail-row" style="border-bottom: none; padding: 0.5rem 0;">
                            <div class="detail-label">
                                <i class="fas fa-envelope me-2"></i>
                                Email:
                            </div>
                            <div class="detail-value">
                                ${attendance.employee.email}
                            </div>
                        </div>
                        </#if>
                    </div>
                </#if>
            <#else>
                <div class="alert alert-warning">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-exclamation-triangle me-3 fs-4"></i>
                        <div>
                            <h5 class="alert-heading mb-2">No Attendance Record Found</h5>
                            <p class="mb-0">The requested attendance record could not be found or has been removed.</p>
                        </div>
                    </div>
                </div>
            </#if>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Employee Management System. All rights reserved.</p>
            <p>Streamlining workforce management for modern businesses</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>