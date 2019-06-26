package app.servlets;

import app.dao.UserDAOImpl;
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


@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {  //Сервлет, работающий с обычными пользователями
    final static Logger logger = Logger.getLogger(UserServlet.class);
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("doPost");
        UserServiceImpl userService = new UserServiceImpl();
        AccountServiceImpl accountService = new AccountServiceImpl();
        if (request.getParameter("payment")!=null){   //проверяем пришел ли параметр payment
            logger.info("payment!=null");               //если пришел, проверяем возможность перевода
            Double moneyAmount = Double.valueOf(request.getParameter("moneyAmount"));
            int personalAccountNumber = Integer.parseInt(request.getParameter("personalAccountNumber"));
            Double balance = userService.getAccountById(personalAccountNumber).getBalance();
            if (balance < moneyAmount ){
                logger.info("notEnoughMoney");
                request.setAttribute("notEnoughMoney", true);               //перевод не осуществлен
            } else {
                logger.info("EnoughMoney");
                int accountNumber = userService.getAccountById(personalAccountNumber).getNumber();
                int recipientAccountNumber = Integer.parseInt(request.getParameter("recipientAccountNumber"));
                if (userService.getAccountByNumber(recipientAccountNumber)!=null){
                    accountService.addMoney(userService.getAccountByNumber(recipientAccountNumber), moneyAmount);
                }
                accountService.withdrawMoney(userService.getAccountById(personalAccountNumber), moneyAmount);       //перевод осуществлен
                accountService.savePayment(moneyAmount, accountNumber, recipientAccountNumber);
                request.setAttribute("notEnoughMoney", false);
            }
            request.removeAttribute("payment");

        }

       if (request.getParameter("block")!=null) {  //проверяем пришел ли параметр block
           logger.info("блокируем счет");       //если пришел -- блокируем счет. проверять не нужно, т к блокируем мы его прямо из таблицы
           int id = Integer.parseInt(request.getParameter("id"));
           userService.blockAccount(id);
           request.removeAttribute("block");
       }

        doGet(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("doGet");
        RequestDispatcher requestDispatcher;
        HttpSession session = request.getSession();
        UserServiceImpl userService = new UserServiceImpl();

        request.setAttribute("userAccounts", userService.getAccountsByUser((User) session.getAttribute("UserObject")));
        requestDispatcher = request.getRequestDispatcher("views/user/personal.jsp");

        requestDispatcher.forward(request, response);
    }



}