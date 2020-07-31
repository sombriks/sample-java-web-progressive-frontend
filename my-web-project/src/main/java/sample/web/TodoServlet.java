package sample.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample.library.Dados;

@WebServlet("/todo")
public class TodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession(true).setAttribute("dados",new Dados());
        request.getRequestDispatcher("/WEB-INF/jsp/todo.jsp").forward(request, response);
    }

}
