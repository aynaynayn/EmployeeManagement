<!DOCTYPE html>
<html>
<head>
    <title>Record Attendance</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>  <!-- external stylesheet -->
    <link rel="stylesheet" href="/styles/add.css"/>
</head>
<body>
<h2>Record Attendance</h2>
<form action="/attendance/add" method="post">
    <input type="number" name="employeeId" placeholder="employeeId" required>
        <input type="date" name="date" placeholder="date" required>
        <div class="status">
        <label>Status</label>
            <div class="radio_btn">
                <label for="Present">Present</label>
                    <input id="Present" type='radio' name="status" value="Present">
                <label for="Absent">Absent</label>
                    <input id="Absent" type='radio' name="status" value="Absent">
                <label for="Late">Late</label>
                    <input id="Late" type='radio' name="status" value="Late">
            </div>
        </div>
    <button type="submit" id="submit">Submit Attendance</button>
</form>
</body>
</html>
