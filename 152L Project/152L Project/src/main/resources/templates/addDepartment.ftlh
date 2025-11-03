<!DOCTYPE html>
<html>
<head>
    <title>Add New Department</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>  <!-- external stylesheet -->
    <link rel="stylesheet" href="/styles/add.css"/>
</head>
<body>
<div class="container">
    <h1>Add Department</h1>
    <form action="/departments/add" method="post">
        <div class="row">
        <label for="id">ID</label>
        <input type="number" id="id" name="id" required></div>
        <div class="row">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required></div>
        <div class="row">
        <label for="employeeCount">Employee Count</label>
        <input type="number" id="employeeCount" name="employeeCount" required></div>
        <button type="submit" id="submit">Add Department</button>
    </form>
</div>
</body>
</html>