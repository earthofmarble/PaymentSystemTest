<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- СТРАНИЦА ИЗМЕНЕНИЯ ДАННЫХ ПОЛЬЗОВАТЕЛЯ -->

<html>
<head>
    <title>Редактировать данные пользователя</title>
</head>
<body>

ID пользователя: ${param.id}?
<div>

    <form action="/admin" method="post" enctype="application/x-www-form-urlencoded">
        <input required type="text" name="name" placeholder="Имя"/>
        <input required type="text" name="secondName" placeholder="Фамилия"/>
        <input required type="text" name="login" placeholder="Логин"/>
        <input required type="password" name="password" placeholder="Пароль"/>
        <select required name="isAdmin">
            <option value="true">Администратор</option>
            <option value="false">Не администратор</option>
        </select>
        <input type="hidden" name="editUser" value="qwe"/>
        <input type="hidden" name="id" value="${param.id}"/>
        <input type="submit" value="Изменить">
    </form>

</div>
</body>
</html>
