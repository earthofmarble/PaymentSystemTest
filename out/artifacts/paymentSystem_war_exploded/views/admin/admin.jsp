<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 25-Jun-19
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- КАБИНЕТ АДМИНИСТРАТОРА -->

<html>
<head>
    <title>Login page</title>
</head>

<body>
<div>
    <h1>ADMIN</h1>
</div>
<div>
    <form action="views/admin/addUser.jsp" method="post">
        <input type="hidden" name="userAccounts" value="${userAccounts}">
        <input type="submit" value="Добавить пользователя" style="float:left">

    </form>

</div>
<div>
    <form action="views/admin/addAccount.jsp" method="post">
        <input type="hidden" name="userAccounts" value="${userAccounts}">
        <input type="submit" value="Добавить счёт" style="float:left">
    </form>

</div>
<div>
    <form action="views/admin/listUsers.jsp" method="post">
        <input type="hidden" name="allUsers" value="${allUsers}">
        <input type="submit" value="Список пользователей" style="float:left">
    </form>
</div>
<%
    if (request.getAttribute("message")!=null) {
        out.println("<p>"+ request.getAttribute("message") +" </p>");
        request.removeAttribute("message");
    }
%>
<div>
    <form action="views/admin/listAccounts.jsp" method="post">
        <input type="hidden" name="userAccounts" value="${userAccounts}">
        <input type="submit" value="Список счетов" style="float:left">
    </form>
</div>
<div>
<div>
    <form action="/logout">
        <input type="submit" value="ВЫХОД ИЗ АККАУНТА" style="float:left">
    </form>
</div>
</div>

</body>
</html>