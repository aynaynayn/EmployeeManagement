<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/styles/main.css"/>  <!-- external stylesheet -->
    <link rel="stylesheet" href="/styles/add.css"/>
</head>
<body>
<div class="container">
    <h1>Add Employee</h1>
    <form action="/employees/add" method="post">
        <div class="row">
            Name: <input type="text" name="name">
            Email: <input type="email" name="email">
        </div>
        <div class="row">
            Department: <input type="text" name="department">
            Position: <input type="text" name="position">
        </div>
        Date Hired: <input type="date" name="dateHired">
        <button type="submit" id="submit">Save</button>
    </form>
    <a href="/employees/list">Back to List</a>
</div>
</body>
</html>
