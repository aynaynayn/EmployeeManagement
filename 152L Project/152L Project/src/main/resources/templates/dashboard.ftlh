<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard - Employee Record Management</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --border-radius: 12px;
            --shadow: 0 4px 6px rgba(0,0,0,0.1);
            --shadow-lg: 0 10px 25px rgba(0,0,0,0.15);
            --transition: all 0.3s ease;
            --light-bg: rgba(255,255,255,0.95);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            min-height: 100vh;
        }

        .hero-section {
            text-align: center;
            color: white;
            padding: 4rem 2rem 2rem;
        }

        .hero-section h1 {
            font-size: 3rem;
            font-weight: 700;
        }

        .hero-section p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .content-box {
            background: var(--light-bg);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 1300px;
            box-shadow: var(--shadow-lg);
        }

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .card-stat {
            background: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            text-align: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }

        .card-stat:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .card-stat i {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--primary-color);
        }

        .card-stat h3 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .card-stat p {
            color: #6c757d;
            margin: 0;
        }

        .chart-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .chart-box {
            background: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: var(--shadow);
        }

        .recent-table {
            margin-top: 2rem;
        }

        th {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            text-align: center;
        }

        td {
            text-align: center;
            background: white;
        }

        .footer {
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 2rem;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            border-top: 1px solid rgba(255,255,255,0.2);
        }

        @media (max-width: 768px) {
            .hero-section h1 { font-size: 2.2rem; }
            .content-box { padding: 1.5rem; }
        }
    </style>
</head>
<body>

<!-- Hero -->
<div class="hero-section">
    <h1>Management Dashboard</h1>
    <p>Quick overview of your organization’s workforce and attendance</p>
</div>

<!-- Dashboard Content -->
<div class="content-box">

    <!-- Summary Cards -->
    <div class="summary-cards">
        <div class="card-stat">
            <i class="fas fa-users"></i>
            <h3>${totalEmployees}</h3>
            <p>Total Employees</p>
        </div>
        <div class="card-stat">
            <i class="fas fa-building"></i>
            <h3>${totalDepartments}</h3>
            <p>Departments</p>
        </div>
        <div class="card-stat">
            <i class="fas fa-user-check"></i>
            <h3>${presentToday}</h3>
            <p>Present Today</p>
        </div>
        <div class="card-stat">
            <i class="fas fa-user-clock"></i>
            <h3>${lateOrAbsent}</h3>
            <p>Late / Absent</p>
        </div>
    </div>

    <!-- Charts -->
    <div class="chart-section">
        <div class="chart-box">
            <h5 class="text-center mb-3">Attendance Trend (Last 7 Days)</h5>
            <canvas id="attendanceChart"></canvas>
        </div>
        <div class="chart-box">
            <h5 class="text-center mb-3">Department Distribution</h5>
            <canvas id="departmentChart"></canvas>
        </div>
    </div>

    <!-- Recent Activity -->
    <div class="recent-table">
        <h4 class="mb-3">Recent Attendance Records</h4>
        <table class="table table-bordered align-middle">
            <thead>
                <tr>
                    <th>Employee</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Department</th>
                </tr>
            </thead>
            <tbody>
                <#if recentAttendance?? && recentAttendance?has_content>
                    <#list recentAttendance as record>
                    <tr>
                        <td>${record.employee.name}</td>
                        <td>${record.date}</td>
                        <td>
                            <#if record.status == 'Present'>
                                <span class="badge bg-success">Present</span>
                            <#elseif record.status == 'Absent'>
                                <span class="badge bg-danger">Absent</span>
                            <#elseif record.status == 'Late'>
                                <span class="badge bg-warning text-dark">Late</span>
                            <#else>
                                <span class="badge bg-secondary">${record.status}</span>
                            </#if>
                        </td>
                        <td>${record.employee.department.name!''}</td>
                    </tr>
                    </#list>
                <#else>
                    <tr><td colspan="4" class="text-center">No recent attendance records.</td></tr>
                </#if>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2023 Employee Record Management System. All rights reserved.</p>
</footer>

<!-- Chart.js Scripts -->
<script>
    // Attendance Trend Chart
    const attendanceCtx = document.getElementById('attendanceChart').getContext('2d');
    new Chart(attendanceCtx, {
        type: 'line',
        data: {
            labels: ${attendanceDates!["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
            datasets: [
                {
                    label: 'Present',
                    data: ${attendancePresent! [10, 12, 14, 13, 15, 14, 12]},
                    borderColor: '#27ae60',
                    tension: 0.4
                },
                {
                    label: 'Absent',
                    data: ${attendanceAbsent! [2, 1, 0, 3, 1, 0, 1]},
                    borderColor: '#e74c3c',
                    tension: 0.4
                },
                {
                    label: 'Late',
                    data: ${attendanceLate! [1, 2, 1, 1, 0, 1, 2]},
                    borderColor: '#f39c12',
                    tension: 0.4
                }
            ]
        },
        options: {
            responsive: true,
            plugins: { legend: { position: 'bottom' } },
            scales: { y: { beginAtZero: true } }
        }
    });

    // Department Distribution Chart
    const deptCtx = document.getElementById('departmentChart').getContext('2d');
    new Chart(deptCtx, {
        type: 'pie',
        data: {
            labels: ${departmentNames! ["IT", "HR", "Finance", "Sales"]},
            datasets: [{
                data: ${departmentCounts! [15, 10, 13, 20]},
                backgroundColor: ['#3498db', '#9b59b6', '#e67e22', '#2ecc71']
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { position: 'bottom' } }
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
