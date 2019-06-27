<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

  <!-- СТРАНИЦА СОЗДАНИЯ НОВОГО СЧЕТА-->

<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=cp1251">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Добавить счет</title>
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Создание счета</h1>
</div>

<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>Новый аккаунт: </h2>
        </div>
<form action = "/admin" class="w3-selection w3-light-grey w3-padding" method="post">
    <input required type="number" name="number" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%" placeholder="Номер"/>
    <input required type="number" name="ownersId" class="w3-input w3-animate-input w3-border w3-round-large" placeholder="id Пользователя"/>
    <input type="hidden" name="addNewAccount" value="qwe"/>
    <input class="w3-btn w3-green w3-round-large w3-margin-bottom" type="submit" value="Добавить счет"/>
</form>
    </div>
</div>
</body>
</html>

