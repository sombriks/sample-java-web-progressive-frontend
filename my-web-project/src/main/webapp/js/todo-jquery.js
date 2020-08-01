function list() {
    $(".clone").remove()
    $.ajax("todo-json", {
        success: function (data) {
            if(!data.items.length)
                $("#parent").append("<h2 class='clone'>No available tasks</h2>")
            $.each(data.items, function (idx, item) {
                var todo = $("#_template").clone()
                todo.addClass("clone");
                todo.attr("id", "todo_" + item.id)
                todo.find(".input").val(item.description)
                todo.find("input[type=checkbox]")[item.done ? "attr" : "removeAttr"]("checked", "true")
                todo.find("button").on("click", function () {
                    $.ajax("todo-json", {
                        contentType: "application/json",
                        type: "POST",
                        data: JSON.stringify({
                            id: item.id,
                            description: todo.find(".input").val(),
                            done: todo.find("input[type=checkbox]").prop("checked")
                        }),
                        success: list
                    })
                })
                todo.css({display: ""})
                $("#parent").append(todo)
            })
        }
    })
}

list()

$("#add").on("click", function () {
    $.ajax("todo-json", {
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify({
            description: $("#description").val()
        }),
        success: function () {
            list()
            $("#description").val("")
        }
    })
})
