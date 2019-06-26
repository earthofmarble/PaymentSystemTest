<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 25-Jun-19
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--СТРАНИЦА АВТОРИЗАЦИИ -->

<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Авторизация</title>
</head>

<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Введите логин и пароль</h1>
</div>

<div class="w3-container w3-padding">

    <%
        if (request.getAttribute("canLogin")!=null) {
            if (!request.getAttribute("canLogin").equals(true)) {
                out.println("<p>Пользователь не существует!</p>");
            }

        }
    %>
    <div class="w3-card-4">
        <form method="post" class="w3-selection w3-light-grey w3-padding">
            <label>Логин:
                <input type="text" name="loginName" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>Пароль:
                <input type="password" name="loginPassword" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Войти</button>
        </form></div>
    </div>


<div>
    <button  class="w3-btn w3-round-large"  onclick="location.href=''">Вернуться на главную</button>
</div>
</body>
</html>