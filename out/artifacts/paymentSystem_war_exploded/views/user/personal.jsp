<%@ page import="app.entities.User" %>
<%@ page import="app.entities.Account" %>
<%@ page import="app.dao.UserDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="app.services.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 25-Jun-19
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- ЛИЧНЫЙ КАБИНЕТ ПОЛЬЗОВАТЕЛЯ -->

<html>
<head>
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
    <title>Личный кабинет пользователя</title>
</head>
<body>
<% UserServiceImpl userService = new UserServiceImpl(); %>
<p>Ваш ID  ${UserObject.getId()}</p>

<div>
    <table border="2">
        <tr>
            <td>ID</td>
            <td>Номер счета</td>
            <td>Баланс</td>
            <td>Состояние</td>
            <td>Действия</td>
        </tr>
        <c:forEach items="${userAccounts}" var = "account">
            <tr>
                <td>${account.getId()}</td>
                <td>${account.getNumber()}</td>
                <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${account.getBalance()}"/></td>
                <td>
                        <c:if test="${account.isBlocked()==true}">ЗАБЛОКИРОВАН</c:if>
                        <c:if test="${account.isBlocked()==false}">АКТИВЕН</c:if>
                </td>
                <td>
                    <form action="views/user/blockAccount.jsp" method="post">
                        <c:if test="${account.isBlocked()==true}"><input disabled type="submit" value="Заблокировать" style="float:left"></c:if>
                        <c:if test="${account.isBlocked()==false}"><input type="submit" value="Заблокировать" style="float:left"></c:if>

                        <input type="hidden" name="id" value="${account.getId()}">

                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div>
    <form action="views/user/makePayment.jsp" method="post">
        <input type="hidden" name="userAccounts" value="${userAccounts}">
            <%
                User userTemp = (User) session.getAttribute("UserObject");
                session.setAttribute("userAccounts", userService.getAccountsByUser(userTemp));
                List<Account> list = (List<Account>) session.getAttribute("userAccounts");
                int count = 0;
                for (Account account:list) {
                    if (!account.isBlocked())
                        count++;
                }
                if (count==0){
                    out.println("<input disabled type=\"submit\" value=\"Платёж\" style=\"float:left\">");
                    out.println("<p> Нет доступных счетов для совершения платежа </p>");
                } else
                    out.print("<input type=\"submit\" value=\"Платёж\" style=\"float:left\">");
            %>

    </form>
    <%
        if (request.getAttribute("notEnoughMoney")!=null && request.getAttribute("notEnoughMoney").equals(false)) {
            out.println("<p> Платёж выполнен </p>");
            request.removeAttribute("notEnoughMoney");
        } else if (request.getAttribute("notEnoughMoney")!=null && request.getAttribute("notEnoughMoney").equals(true)) {
            out.println("<p> Недостаточно средств </p>");
            request.removeAttribute("notEnoughMoney");
        }
    %>

</div>
<div>
    <form action="views/user/paymentsList.jsp" method="post">
        <input type="hidden" name="userAccounts" value="${userAccounts}">
        <input type="submit" value="Список платежей" style="float:left">
    </form>
</div>

<div>
    <form action="/logout">
        <input type="submit" value="ВЫХОД ИЗ АККАУНТА" style="float:left">
    </form>
</div>
</body>
</html>