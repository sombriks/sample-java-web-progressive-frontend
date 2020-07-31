<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TODO List jQuery</title>
    <script src="js/libs/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bulma.min.css"/>
</head>
<body>

<div class="level">
    <section class="container">
        <h1>Sample TODO list with jQuery</h1>
        <a href="todo">Back</a>
        <div class="tile is-vertical" id="parent">
            <div class="tile box">
                <div class="field has-addons">
                    <div class="control">
                        <input class="input" id="description" minlength="1" maxlength="30" placeholder="New task">
                    </div>
                    <div class="control">
                        <button id="add" class="button is-primary">ADD</button>
                    </div>
                </div>
            </div>
            <div id="_template" class="tile box level" style="display:none">
                <div class="field level-item">
                    <div class="control">
                        <input class="input" name="description" minlength="1" maxlength="30"
                               value="_template">
                    </div>
                </div>
                <div class="field level-item">
                    <div class="control">
                        <label class="checkbox">
                            <input name="done" type="checkbox" checked>
                            Done
                        </label>
                    </div>
                </div>
                <div class="field level-item">
                    <div class="control">
                        <button class="button is-primary">SAVE</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="js/todo-jquery.js"></script>
</body>
</html>
