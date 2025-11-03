<!DOCTYPE html>
<html>
<head>
    <title>Record Attendance</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>  <!-- external stylesheet -->
    <link rel="stylesheet" href="/styles/add.css"/>
</head>
<body>
<div class="container">
<h2>Record Attendance</h2>
<form action="/attendance/add" method="post">
    <input type="text" name="employeeId" placeholder="employeeId" required>
    <input type="date" name="date" placeholder="date" required>
    <div class="status">
    <label>Status</label>
        <div class="radio_btn">
            <input id="Present" type='radio' name="status" value="Present">
                <label for="Present">Present</label>
            <input id="Absent" type='radio' name="status" value="Absent">
                <label for="Absent">Absent</label>
            <input id="Late" type='radio' name="status" value="Late">
                <label for="Late">Late</label>
        </div>
    </div>
    <button type="submit" id="submit">Submit</button>
</form>
</div>
</body>
</html>
