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
    <title>Добавить счет</title>
</head>
<body>
<div>Добавление счет: </div>
<form action = "/admin" method="post">
    <input required type="number" name="number" placeholder="Номер"/>
    <input required type="number" name="ownersId" placeholder="id Пользователя"/>
    <input type="hidden" name="addNewAccount" value="qwe"/>
    <input type="submit" value="Добавить счет"/>
</form>
</body>
</html>

