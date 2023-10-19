package servlet;

import dao.UserDAO;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({
        "/user/index",
        "/user/create",
        "/user/update",
        "/user/delete",
        "/user/reset",
        "/user/edit/*",
        "/user/delete/*",
})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public UserServlet(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        request.setCharacterEncoding("utf-8");

        User user = null;
        if (url.contains("delete")){
            UserDAO dao = new UserDAO();
            if (request.getParameter("id")!= null){
                dao.remove(request.getParameter("id"));
                request.setAttribute("message", "Delete success!");
            }
            user = new User();
            request.setAttribute("user", user);
        }
        else if (url.contains("edit")){
            UserDAO dao = new UserDAO();
            if (request.getParameter("id")!= null)
                user = dao.findById(request.getParameter("id"));
            request.setAttribute("user", user);
        } else if (url.contains("reset")) {
            user = new User();
            request.setAttribute("user", user);
        }

        findAll(request, response);
        request.getRequestDispatcher("/views/user.jsp").forward(request,response);
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserDAO dao = new UserDAO();
            List<User> list = dao.findAll();
            request.setAttribute("users", list);
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error","Error: "+ e.getMessage() );
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String url = request.getRequestURL().toString();
        request.setCharacterEncoding("utf-8");
        User user = new User();
        if (url.contains("create")){
            create(request, response);
        } else if (url.contains("update")) {
            update(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
        } else if (url.contains("reset")) {
            request.setAttribute("user", new User());
        }
        findAll(request, response);
        request.getRequestDispatcher("/views/user.jsp").forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            User user = new User();
            BeanUtils.populate(user, request.getParameterMap());
            UserDAO dao = new UserDAO();
            dao.create(user);
            request.setAttribute("message", "Create success!");
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
    private void update(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            User user = new User();
            BeanUtils.populate(user, request.getParameterMap());
            UserDAO dao = new UserDAO();
            dao.update(user);
            request.setAttribute("message", "Update success!");
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        try {
            User user = new User();
            BeanUtils.populate(user, request.getParameterMap());
            UserDAO dao = new UserDAO();
            if (user.getId()!=null)
                dao.remove(user.getId());
            request.setAttribute("message", "Delete success!");
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }


}
