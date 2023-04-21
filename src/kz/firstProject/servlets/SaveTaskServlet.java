package kz.firstProject.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.firstProject.db.DBManager;
import kz.firstProject.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/save-task")
public class SaveTaskServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("task_id"));
        String name = request.getParameter("task_name");
        String description = request.getParameter("task_description");
        String deadlineDate = request.getParameter("task_deadline_date");
        String done = request.getParameter("task_done");

        Tasks task = DBManager.getTask(id);
        if (task!=null){
            task.setName(name);
            task.setDescription(description);
            task.setDeadlineDate(deadlineDate);
            task.setDone(done);

            DBManager.updateTask(task);
            response.sendRedirect("/details?task_id="+id);
        }else {
            response.sendRedirect("/");
        }



    }

}
