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
    Name: <input type="text" name="name"><br>
    Email: <input type="email" name="email"><br>
    Department: <input type="text" name="department"><br>
    Position: <input type="text" name="position"><br>
    Date Hired: <input type="date" name="dateHired"><br>
    <button type="submit">Save</button>
</form>
<a href="/employees/list">Back to List</a>
</body>
</html>
