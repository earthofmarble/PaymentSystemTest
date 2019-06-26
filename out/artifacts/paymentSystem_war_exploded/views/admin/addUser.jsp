<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=Cp1251" pageEncoding="Cp1251" language="java" %>

<!-- СТРАНИЦА СОЗДАНИЯ НОВОГО ПОЛЬЗОВАТЕЛЯ -->

<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=cp1251">
    <title>Добавить пользователя</title>
</head>
<body>
<div>Добавление пользователя: </div>
<form action = "/admin" method="post">
    <input required type="text" name="name" placeholder="Имя"/>
    <input required type="text" name="secondName" placeholder="Фамилия"/>
    <input required type="text" name="login" placeholder="Логин"/>
    <input required type="password" name="password" placeholder="Пароль"/>
    <select required name="isAdmin">
        <option value="true">Администратор</option>
        <option value="false">Не администратор</option>
    </select>
    <input type="hidden" name="addNewUser" value="qwe"/>
    <input type="submit" value="Добавить пользователя"/>
</form>
</body>
</html>
