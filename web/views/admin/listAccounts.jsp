<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- СТРАНИЦА ВЫВОДА ВСЕХ СЧЕТОВ -->
<html>
<head>
    <title>Список счетов</title>
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
<div>
    <table border="2">
        <tr>
            <td>Id</td>
            <td>Номер</td>
            <td>Баланс</td>
            <td>Владелец</td>
            <td>isBlocked</td>
            <td>Действия</td>
        </tr>
        <c:forEach items="${userAccounts}" var = "account">
            <tr>
                <td>${account.getId()}</td>
                <td>${account.getNumber()}</td>
                <td>${account.getBalance()}</td>
                <td>${account.getOwnersId()}</td>
                <td>${account.isBlocked()}</td>
                <td>
                    <form action="/views/admin/editAccount.jsp" method="post">
                        <input type="submit" value="Редактировать" style="float:left">
                        <input type="hidden" name="id" value="${account.getId()}">
                    </form>
                    <form action="/views/admin/deleteAccount.jsp" method="post">
                        <input type="submit" value="Удалить" style="float:left">
                        <input type="hidden" name="id" value="${account.getId()}">
                    </form>
                    <form action="/views/admin/unlockAccount.jsp" method="post">
                        <input type="hidden" name="id" value="${account.getId()}">
                        <c:if test ="${account.isBlocked()==true}"><input type="submit" value="Разблокировать" style="float:left"></c:if>
                    </form>
                    <form action="/views/admin/blockAccount.jsp" method="post">
                    <input type="hidden" name="id" value="${account.getId()}">
                        <c:if test="${account.isBlocked()==false}"><input type="submit" value="Заблокировать" style="float:left"></c:if>
                        <input type="hidden" name="id" value="${account.getId()}">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
