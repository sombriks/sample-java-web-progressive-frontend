<%@ page import="sample.library.Dados" %>
<%@ page import="sample.library.TodoItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TODO List No Script</title>
    <link rel="stylesheet" href="css/bulma.min.css"/>
</head>
<body>
<div class="level">
    <section class="container">
        <h1>Sample TODO list with server side rendering</h1>
        <a href="todo">Back</a>
        <div class="tile is-vertical">
            <form class="tile box" method="post" action="todo-no-script">
                <div class="field has-addons">
                    <div class="control">
                        <input class="input" name="description" minlength="1" maxlength="30" placeholder="New task">
                        <input type="hidden" name="op" value="add"/>
                    </div>
                    <div class="control">
                        <input class="button is-primary" type="submit" value="ADD">
                    </div>
                </div>
            </form>
            <%
                Dados dados = (Dados) request.getSession().getAttribute("dados");
                if (dados != null && dados.getItems().size() > 0) {
                    for (TodoItem d : dados.getItems()) { %>
            <form class="tile box level" method="post" action="todo-no-script">
                <div class="field level-item">
                    <div class="control">
                        <input class="input" name="description" minlength="1" maxlength="30"
                               value="<%=d.getDescription()%>">
                        <input type="hidden" name="op" value="edit"/>
                        <input type="hidden" name="id" value="<%=d.getId()%>"/>
                    </div>
                </div>
                <div class="field level-item">
                    <div class="control">
                        <label class="checkbox">
                            <input name="done" type="checkbox" value="true" <%=d.isDone()? "checked" : ""%> >
                            Done
                        </label>
                    </div>
                </div>
                <div class="field level-item">
                    <div class="control">
                        <input class="button is-primary" type="submit" value="SAVE">
                    </div>
                </div>
            </form>
            <% }
            } else { %>
            <h2>No available tasks</h2>
            <% }%>
        </div>
    </section>
</div>
</body>
</html>
