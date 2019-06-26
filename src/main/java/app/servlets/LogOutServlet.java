package app.servlets;

import app.entities.Account;
import app.entities.User;
import app.services.UserServiceImpl;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "LogOutServlet")
public class LogOutServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(LogOutServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("doPost LogOut");
        HttpSession session = request.getSession();
        session.removeAttribute("UserObject");      //при выходе из аккаунта, удаляем все сессионные аттрибуты
        session.removeAttribute("userAccounts");
        session.removeAttribute("allUsers");
        session.removeAttribute("userAccounts");
        session.setAttribute("reLogin", true);
        session.setAttribute("canLogin", false);
        session.setAttribute("isAdmin", false);
        response.sendRedirect("/login");  //отправляем авторизироваться


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("doGet LogOut");
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("views/user/logOut.jsp");
        requestDispatcher.forward(request, response);

    }
}