<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>

<!-- СТРАНИЦА УДАЛЕНИЯ ПОЛЬЗОВАТЕЛЯ -->

<html>
<head>
    <title>Удалить пользователя?</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Вы действительно хотите удалить пользователя ${param.id}?</h1>
</div>

<div class="w3-container w3-center">
    <div class="w3-bar w3-padding-large w3-padding-24">
<form action="/admin" method="post" enctype="application/x-www-form-urlencoded">
    <input type="hidden" name="id" value="${param.id}">
    <input type="hidden" name="deleteUser" value="${param.id}">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" class="w3-btn w3-green w3-round-large" value="Удалить">
</form>
    </div>
</div>
</body>
</html>
