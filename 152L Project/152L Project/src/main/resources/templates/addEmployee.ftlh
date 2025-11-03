<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>  <!-- external stylesheet -->
    <link rel="stylesheet" href="/styles/add.css"/>
</head>

<body>
<h2>Add Employee</h2>
<form action="/employees/add" method="post">
    <input type="text" placeholder="Name" required><br>
    <input type="email" placeholder="Email" required><br>
    <input type="text" placeholder="Department" required><br>
    <input type="text" placeholder="Position" required><br>
    <input type="date" placeholder="Date Hired" required><br>
    <button type="submit">Save</button>
</form>
<a href="/employees/list">Back to List</a>
</body>
</html>
