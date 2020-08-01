package sample.web;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import sample.library.Dados;
import sample.library.TodoItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/todo-json")
public class TodoJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Dados dados = (Dados) request.getSession().getAttribute("dados");
        Gson g = new GsonBuilder().create();
        response.setHeader("Content-Type", "application/json");
        response.getWriter().write(g.toJson(dados));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Gson g = new GsonBuilder().create();
        TodoItem update = g.fromJson(request.getReader(), TodoItem.class);
        Dados dados = (Dados) request.getSession().getAttribute("dados");
        if (update.getId() > 0)
            dados.getItems().stream().filter(e -> e.getId() == update.getId()).findAny().ifPresent(item -> {
                item.setDescription(update.getDescription());
                item.setDone(update.isDone());
            });
        else
            dados.getItems().add(new TodoItem(update.getDescription()));
    }
}
