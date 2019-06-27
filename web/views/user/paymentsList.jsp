<%@ page import="app.services.AccountServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="app.entities.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="app.entities.Payment" %><%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- СПИСОК ПЛАТЕЖЕЙ -->


<html>
<head>
    <title>Список платежей</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
Перевод средств


        <%
            List<Account> accounts = (List<Account>) session.getAttribute("userAccounts");

            if (accounts!=null && accounts.size()>0) {
                AccountServiceImpl accountService = new AccountServiceImpl();

                List<List<Payment>> paymentsList = new ArrayList<>();

                for (Account account : accounts) {
                    paymentsList.add(accountService.getAllPaymentsByAccount(account.getNumber()));
                }

                out.println("<table border=\"2\">\n" +
                        "        <tr>\n" +
                        "            <td>Отправитель</td>\n" +
                        "            <td>Получатель</td>\n" +
                        "            <td>Сумма</td>\n" +
                        "        </tr>");
                for (List<Payment> paymentsListLocal : paymentsList) {
                    for (Payment payment : paymentsListLocal) {
                        out.println("<tr> <td>" + payment.getFrom() + "</td> " +
                                "<td> " + payment.getTo() + "</td> <td> " + payment.getAmount() + "</td></tr>");
                    }
                }
                out.println("</table>");

            } else
                out.println("<p>У вас нет истории платежей</p>");

        %>


<form action = "/personal" method="post">
    <input type="submit" value="Вернуться"/>
</form>
</body>
</html>
