<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 8:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--ВЫХОД ИЗ АККАУНТА -->

<html>
<head>
    <title>Выход из аккаунта</title>
</head>
<body>
<div><p>Вы уверены, что хотите выйти?</p>
    <form action="/logout" method="post">
        <input type="submit" value="Выйти" style="float:left">
    </form>
    <form action="/personal" method="post">
        <input type="submit" value="Вернуться" style="float:left">
    </form>
</div>
</body>
</html>
