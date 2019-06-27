<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>

<!-- СТРАНИЦА ИЗМЕНЕНИЯ ДАННЫХ ПОЛЬЗОВАТЕЛЯ -->

<html>
<head>
    <title>Редактировать данные пользователя</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>ID пользователя: ${param.id}</h1>
</div>
<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>Пользователь:</h2>
        </div>

    <form action="/admin" method="post" class="w3-selection w3-light-grey w3-padding" enctype="application/x-www-form-urlencoded">
        <input required class="w3-input w3-animate-input w3-border w3-round-large" type="text" name="name" placeholder="Имя"/>
        <input required class="w3-input w3-animate-input w3-border w3-round-large"  type="text" name="secondName" placeholder="Фамилия"/>
        <input required class="w3-input w3-animate-input w3-border w3-round-large" type="text" name="login" placeholder="Логин"/>
        <input required class="w3-input w3-animate-input w3-border w3-round-large" type="password" name="password" placeholder="Пароль"/>
        <select class="w3-input w3-animate-input w3-border w3-round-large" required name="isAdmin">
            <option class="w3-input w3-animate-input w3-border w3-round-large" value="true">Администратор</option>
            <option class="w3-input w3-animate-input w3-border w3-round-large" value="false">Не администратор</option>
        </select>
        <input type="hidden" name="editUser" value="qwe"/>
        <input type="hidden" name="id" value="${param.id}"/>
        <input type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom" value="Изменить">
    </form>

    </div></div>
</body>
</html>
