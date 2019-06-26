<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- СТРАНИЦА РАЗБЛОКИРОВКИ СЧЕТА -->

<html>
<head>
    <title>Разблокировать счет?</title>
</head>
<body>

Вы действительно хотите разблокировать счет ${param.id}?

<form action="/admin" method="post" enctype="application/x-www-form-urlencoded">
    <input type="hidden" name="id" value="${param.id}">
    <input type="hidden" name="unlock" value="${param.id}">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Разблокировать">
</form>

</body>
</html>
