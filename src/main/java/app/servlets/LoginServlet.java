package app.servlets;

import app.dao.UserDAOImpl;
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

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(LoginServlet.class);
    private static HashMap<String, Boolean> canLogin = new HashMap<String, Boolean>(){
        {
            put("canLogin", false);
            put("isAdmin", false);
        }
    };

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("doPost LoginServlet");
            HttpSession session = request.getSession();
            User newUser = null;
            String loginName = request.getParameter("loginName");                   //авторизация пользователя
            String loginPassword = request.getParameter("loginPassword");
            User user = new User(null, null, loginName, loginPassword, false);
            canLogin = user.checkLogin(user);
            if (canLogin.get("canLogin")) {                             //проверяем корректность введенных данных
                logger.info("canLogin");
                newUser = user.getUserByLoginAndPassword(user);  //получаем нашего пользователя
            }
            session.setAttribute("isAdmin", canLogin.get("isAdmin"));
            session.setAttribute("canLogin", canLogin.get("canLogin"));
            if (newUser != null) {
                logger.info("newUser != null");
                session.setAttribute("UserObject", newUser);
                UserServiceImpl userService = new UserServiceImpl();
                List<Account> userAccounts = userService.getAccountsByUser(newUser);
                session.setAttribute("userAccounts", userAccounts);
            }
            request.setAttribute("canLogin", canLogin.get("canLogin"));
            doGet(request, response);

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("doGet Login");
        HttpSession session = request.getSession();
        RequestDispatcher requestDispatcher;

        UserServiceImpl userService = new UserServiceImpl();
        if(session.getAttribute("reLogin")!=null){    //когда пользователь вышел из аккаунта reLogin != null
            logger.info("session reLogin != null");
            canLogin.replace("canLogin",false);
            canLogin.replace("isAdmin", false);
            session.removeAttribute("reLogin");
        }
        boolean canLoginBool;
        boolean isAdminBool;
        if (session.getAttribute("canLogin")!= null) {
            canLoginBool = (boolean) session.getAttribute("canLogin");
        } else canLoginBool=canLogin.get("canLogin");
        if (session.getAttribute("isAdmin")!= null) {
            isAdminBool = (boolean) session.getAttribute("isAdmin");
        } else isAdminBool= canLogin.get("isAdmin");

        if (!canLoginBool) {  //если пользователь не смог(не пытался) залогиниться
            logger.info("!canLogin");
            requestDispatcher = request.getRequestDispatcher("views/login.jsp");//отправляем его на страницу авторизации
        } else if (isAdminBool) {
            logger.info("isAdmin");
            requestDispatcher = request.getRequestDispatcher("views/admin/admin.jsp");  //если админ - в "панель администратора"
            session.setAttribute("allUsers", userService.findAllUsers());
            canLogin.replace("canLogin", false);
            canLogin.replace("isAdmin", false);
            response.sendRedirect("/admin");
            return;
        } else {
            logger.info("regularUser");     //обычный юзер - в "личный кабинет"
            requestDispatcher = request.getRequestDispatcher("views/user/personal.jsp");
            canLogin.replace("canLogin", false);
            canLogin.replace("isAdmin", false);
            response.sendRedirect("/personal");
            return;
        }

        requestDispatcher.forward(request, response);
        session.removeAttribute("allUsers");
        canLogin.replace("canLogin", false);
        canLogin.replace("isAdmin", false);
    }



}