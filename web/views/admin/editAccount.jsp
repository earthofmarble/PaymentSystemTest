<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>

<!-- СТРАНИЦА РЕДАКТИРОВАНИЯ ДАННЫХ О СЧЕТЕ -->

<html>
<head>
    <title>Редактировать данные счета</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>ID счёта: ${param.id}</h1>
</div>
<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>Счет:</h2>
        </div>
    <form action="/admin" method="post" class="w3-selection w3-light-grey w3-padding"  enctype="application/x-www-form-urlencoded">
        <input class="w3-input w3-animate-input w3-border w3-round-large" required type="number" name="number" placeholder="Номер"/>
        <input class="w3-input w3-animate-input w3-border w3-round-large" required type="number" name="ownersId" placeholder="id Пользователя"/>
        <input class="w3-input w3-animate-input w3-border w3-round-large" type="hidden" name="editAccount" value="qwe"/>
        <input  type="hidden" name="id" value="${param.id}"/>
        <input type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom" value="Редактировать счет"/>
    </form>

    </div></div>
</body>
</html>

