<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!--СТРАНИЦА БЛОКИРОВКИ СЧЕТА -->

<html>
<head>
    <title>Заблокировать счет?</title>
</head>
<body>

Вы действительно хотите заблокировать счет ${param.id}?

<form action="/admin" method="post" enctype="application/x-www-form-urlencoded">
    <input type="hidden" name="id" value="${param.id}">
    <input type="hidden" name="block" value="${param.id}">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Заблокировать">
</form>

</body>
</html>
