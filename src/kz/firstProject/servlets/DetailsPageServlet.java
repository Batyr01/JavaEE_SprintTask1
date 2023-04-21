package kz.firstProject.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.firstProject.db.DBManager;
import kz.firstProject.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = -1L;
        try{
            id = Long.parseLong(request.getParameter("task_id"));
        }catch (Exception e){
        }

        Tasks task = DBManager.getTask(id);

        request.setAttribute("task", task);
        request.getRequestDispatcher("/details.jsp").forward(request, response);
    }
}
