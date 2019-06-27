<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 8:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" %>

<!--ВЫХОД ИЗ АККАУНТА -->

<html>
<head>
    <title>Выход из аккаунта</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Вы уверены, что хотите выйти?</h1>
</div>
<div class="w3-container w3-center">
    <div class="w3-bar w3-padding-large w3-padding-24">
    <form action="/logout" method="post">
        <input type="submit"class="w3-btn w3-light-blue w3-round-large" value="Выйти" style="float:left">
    </form>
    </div>
    <div class="w3-bar w3-padding-large w3-padding-24">
    <form action="/personal" method="post">
        <input type="submit" class="w3-btn w3-green w3-round-large" value="Вернуться" style="float:left">
    </form>
    </div>
</div>
</body>
</html>
