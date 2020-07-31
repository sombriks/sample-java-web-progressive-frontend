<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TODO List</title>
    <link rel="stylesheet" href="css/bulma.min.css"/>
</head>
<body>
<div class="level">
    <section class="container">
        <h1>Sample TODO list</h1>
        <ul>
            <li><a href="todo-no-script">no-script version</a></li>
            <li><a href="todo-jquery">jQuery version</a></li>
            <li><a href="todo-vue">Vue version</a></li>
        </ul>
        There is ${sessionScope.dados.items.size()} TODO items.
    </section>
</div>
</body>
</html>
