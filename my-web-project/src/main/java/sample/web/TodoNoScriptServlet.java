package sample.web;

import sample.library.Dados;
import sample.library.TodoItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/todo-no-script")
public class TodoNoScriptServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/todo-no-script.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dados dados = (Dados) request.getSession().getAttribute("dados");
        String description = request.getParameter("description");
        String done = request.getParameter("done");
        String id = request.getParameter("id");
        String op = request.getParameter("op");
        if ("add".equals(op)) {
            dados.getItems().add(new TodoItem(description));
        } else if ("edit".equals(op)) {
            dados.getItems().stream().filter(e -> e.getId() == Long.parseLong(id)).findAny().ifPresent(item -> {
                item.setDescription(description);
                item.setDone(Boolean.parseBoolean(done));
            });
        }
        request.getRequestDispatcher("/WEB-INF/jsp/todo-no-script.jsp").forward(request, response);
    }

}
