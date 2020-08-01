<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TODO List Vue</title>
    <script src="js/libs/vue.min.js"></script>
    <script src="js/libs/axios.min.js"></script>
    <link rel="stylesheet" href="css/bulma.min.css"/>
</head>
<body>
<div class="level">
    <section class="container">
        <h1>Sample TODO list with Vue</h1>
        <a href="todo">Back</a>
        <div class="tile is-vertical" id="parent">
            <div class="tile box">
                <div class="field has-addons">
                    <div class="control">
                        <input class="input" v-model="description" minlength="1" maxlength="30" placeholder="New task">
                    </div>
                    <div class="control">
                        <button class="button is-primary" @click="add">ADD</button>
                    </div>
                </div>
            </div>
            <div class="tile box level" v-for="item in items" :key="item.id">
                <div class="field level-item">
                    <div class="control">
                        <input class="input" name="description" minlength="1" maxlength="30"
                               v-model="item.description">
                    </div>
                </div>
                <div class="field level-item">
                    <div class="control">
                        <label class="checkbox">
                            <input name="done" type="checkbox" v-model="item.done">
                            Done
                        </label>
                    </div>
                </div>
                <div class="field level-item">
                    <div class="control">
                        <button @click="save(item)" class="button is-primary">SAVE</button>
                    </div>
                </div>
            </div>
            <h2 v-if="!items.length">No available tasks</h2>
        </div>
    </section>
</div>
<script src="js/todo-vue.js"></script>
</body>
</html>
