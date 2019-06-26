package app.servlets;

import app.entities.Account;
import app.entities.User;
import app.services.AccountServiceImpl;
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

@WebServlet(name = "AdminServlet")
public class AdminServlet extends HttpServlet {   //сервлет для работы с аккаунтами администраторов

    final static Logger logger = Logger.getLogger(AdminServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("doPost started");
        UserServiceImpl userService = new UserServiceImpl();
        AccountServiceImpl accountService = new AccountServiceImpl();

        if (request.getParameter("addNewUser")!=null){   //проверяем, пришел ли параметр добавления нового пользователя
            logger.info("addNewUser started");
            boolean isAdminTemp;                        //проверяем является ли новый пользователь администратором
            if (request.getParameter("isAdmin").equals("true")){
                isAdminTemp=true;
                logger.info("isAdmin");
            } else if (request.getParameter("isAdmin").equals("false")){
                isAdminTemp=false;
                logger.info("!isAdmin");
            } else {  isAdminTemp=false;
                System.out.println("NULL");
                logger.info("!isAdmin null");
            }               //создаем объект нового пользователя
            User newUser = new User(request.getParameter("name"), request.getParameter("secondName"), request.getParameter("login"), request.getParameter("password"), isAdminTemp);
            boolean loginAvaiable = newUser.isLoginAvaiable(newUser);
            if (loginAvaiable){
                userService.save(newUser);      //если логин не занят, то сохраняем
                logger.info("Пользователь добавлен");
                request.setAttribute("message", "Пользователь добавлен!");
            } else {
                logger.info("Пользователь с таким логином уже существует");    // иначе не сохраняем
                request.setAttribute("message", "Пользователь с таким логином уже существует");
            }

            request.removeAttribute("addNewUser");
        }

        if (request.getParameter("addNewAccount")!=null) {  //новый счёт(аккаунт)
            logger.info("addNewAccount started");
            Account newAccount = new Account(Integer.parseInt(request.getParameter("number")), 0, Integer.parseInt(request.getParameter("ownersId")), false );
            boolean numberAvaiable = newAccount.isNumberAvaiable(newAccount);
            boolean isUserPresent = newAccount.isSuchIdPresent(newAccount.getOwnersId());
            if (numberAvaiable && isUserPresent){     //проверяем свободен ли номер счёта и существует ли пользователь, привязанный к счету
                userService.save(newAccount);
                logger.info("Новый счет добавлен");
                request.setAttribute("message", "Счет добавлен!");
            } else if (!numberAvaiable && !isUserPresent){
                logger.info("Пользователя с таким id не существует, да и номер такой уже есть");
                request.setAttribute("message", "Пользователя с таким id не существует, да и номер такой уже есть");
            } else if(!numberAvaiable){
                logger.info("Такой номер уже зарегистрирован");
                request.setAttribute("message", "Такой номер уже зарегистрирован");
            } else {
                logger.info("Пользователя с таким id не существует");
                request.setAttribute("message", "Пользователя с таким id не существует");
            }

            request.removeAttribute("addNewAccount");
        }

        if (request.getParameter("block")!=null) {  //блокировка счета
            int id = Integer.parseInt(request.getParameter("block"));
            userService.blockAccount(id);
            logger.info("Заблокировали счет");
            request.removeAttribute("block");
        }
        if (request.getParameter("unlock")!=null) {  //разблокировка счета
            int id = Integer.parseInt(request.getParameter("unlock"));
            userService.unlockAccount(id);
            logger.info("Разблокировали счет");
            request.removeAttribute("unlock");
        }

        if(request.getParameter("deleteAccount")!=null) {  //удаление счёта
            int id = Integer.parseInt(request.getParameter("deleteAccount"));
            Account account = userService.getAccountById(id);
            userService.delete(account);
            request.setAttribute("message", "Счет удалён!");
            logger.info("Удалили счёт");
            request.removeAttribute("deleteAccount");
        }

        if(request.getParameter("deleteUser")!=null) {      //удаление пользователя
            int id = Integer.parseInt(request.getParameter("deleteUser"));
            User user = userService.getUserById(id);
            userService.delete(user);
            request.setAttribute("message", "Пользовател удалён!");
            logger.info("Удалили пользователя");
            request.removeAttribute("deleteUser");
        }

        if(request.getParameter("editUser")!=null) {   //редактируем данные пользователя
            boolean isAdminTemp;
            User curUser =userService.getUserById(Integer.parseInt(request.getParameter("id")));
            if (request.getParameter("isAdmin").equals("true")){
                isAdminTemp=true;
            } else if (request.getParameter("isAdmin").equals("false")){
                isAdminTemp=false;
            } else {  isAdminTemp=false;
            }
            User newUser = new User(request.getParameter("name"), request.getParameter("secondName"), request.getParameter("login"), request.getParameter("password"), isAdminTemp);
            boolean loginAvaiable = curUser.isLoginAvaiable(newUser);
            if (loginAvaiable){
                curUser.setAdmin(isAdminTemp);
                curUser.setFirstName(request.getParameter("name"));
                curUser.setSecondName(request.getParameter("secondName"));
                curUser.setLogin(request.getParameter("login"));
                curUser.setPassword(request.getParameter("password"));
                userService.update(curUser);
                logger.info("Изменили данные пользователя");
                request.setAttribute("message", "Данные пользователя изменены!");
            } else {
                logger.info("Не удалось изменить данные пользователя");
                request.setAttribute("message", "Пользователь с таким логином уже существует");
            }

            request.removeAttribute("editUser");
        }

        if(request.getParameter("editAccount")!=null) {     //редактируем данные о счете
            Account curAccount = userService.getAccountById(Integer.parseInt(request.getParameter("id")));
            Account newAccount = new Account(Integer.parseInt(request.getParameter("number")), 0, Integer.parseInt(request.getParameter("ownersId")), false );
            boolean numberAvaiable = newAccount.isNumberAvaiable(newAccount);
            boolean isUserPresent = newAccount.isSuchIdPresent(newAccount.getOwnersId());
            if (numberAvaiable && isUserPresent){
                curAccount.setNumber(newAccount.getNumber());
                curAccount.setOwnersId(newAccount.getOwnersId());
                userService.update(curAccount);
                logger.info("Изменили информацию о счёте");
                request.setAttribute("message", "Счет обновлён!");
            } else if (!numberAvaiable && !isUserPresent){
                logger.info("Пользователя с таким id не существует, да и номер такой уже есть");
                request.setAttribute("message", "Пользователя с таким id не существует, да и номер такой уже есть");
            } else if(!numberAvaiable){
                logger.info("Такой номер уже зарегистрирован");
                request.setAttribute("message", "Такой номер уже зарегистрирован");
            } else {
                logger.info("Пользователя с таким id не существует");
                request.setAttribute("message", "Пользователя с таким id не существует");
            }

            request.removeAttribute("editAccount");

        }

        doGet(request, response);



    }

            protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                logger.info("doGet started");
                RequestDispatcher requestDispatcher;
                HttpSession session = request.getSession();
                UserServiceImpl userService = new UserServiceImpl();
                request.setAttribute("UserObject", userService.getAccountsByUser((User) session.getAttribute("UserObject")));
                session.setAttribute("allUsers", userService.findAllUsers());
                session.setAttribute("userAccounts", userService.findAllAccounts());

                requestDispatcher = request.getRequestDispatcher("views/admin/admin.jsp");
                System.out.println("DO GET");
                requestDispatcher.forward(request, response);
            }
}