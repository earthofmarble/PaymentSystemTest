<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- СТРАНИЦА РЕДАКТИРОВАНИЯ ДАННЫХ О СЧЕТЕ -->

<html>
<head>
    <title>Редактировать данные счета</title>
</head>
<body>

ID счёта: ${param.id}?
<div>

    <form action="/admin" method="post" enctype="application/x-www-form-urlencoded">
        <input required type="number" name="number" placeholder="Номер"/>
        <input required type="number" name="ownersId" placeholder="id Пользователя"/>
        <input type="hidden" name="editAccount" value="qwe"/>
        <input type="hidden" name="id" value="${param.id}"/>
        <input type="submit" value="Редактировать счет"/>
    </form>

</div>
</body>
</html>

