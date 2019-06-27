<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- СПИСОК ВСЕХ ПОЛЬЗОВАТЕЛЕЙ -->

<html>
<head>
    <title>Список пользователей</title>
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
            <td>Имя</td>
            <td>Фамилия</td>
            <td>Логин</td>
            <td>isAdmin</td>
            <td>действия</td>
        </tr>
        <c:forEach items="${allUsers}" var = "user">
            <tr>
                <td>${user.getId()}</td>
                <td>${user.getFirstName()}</td>
                <td>${user.getSecondName()}</td>
                <td>${user.getLogin()}</td>
                <td>${user.isAdmin()}</td>
                <td>
                    <form action="/views/admin/editUser.jsp" method="post">
                        <input type="submit" value="Редактировать" style="float:left">
                        <input type="hidden" name="id" value="${user.getId()}">
                    </form>
                    <form action="/views/admin/deleteUser.jsp" method="post">
                        <input type="submit" value="Удалить" style="float:left">
                        <input type="hidden" name="id" value="${user.getId()}">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
