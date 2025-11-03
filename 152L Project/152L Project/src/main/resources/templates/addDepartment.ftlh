<!DOCTYPE html>
<html>
<head>
    <title>Add New Department</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>  <!-- external stylesheet -->
    <link rel="stylesheet" href="/styles/add.css"/>
</head>
<body>
<h2>Add Department</h2>
    <form action="/departments/add" method="post">
        <input type="number" id="id" name="id" required>
        <input type="text" id="name" name="name" required>
        <input type="number" id="employeeCount" name="employeeCount" required>
        <button type="submit">Add Department</button>
    </form>
</body>
</html>