<%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=Cp1251" pageEncoding="Cp1251" language="java" %>

<!-- �������� �������� ������ ������������ -->

<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=cp1251">
    <title>�������� ������������</title>
</head>
<body>
<div>���������� ������������: </div>
<form action = "/admin" method="post">
    <input required type="text" name="name" placeholder="���"/>
    <input required type="text" name="secondName" placeholder="�������"/>
    <input required type="text" name="login" placeholder="�����"/>
    <input required type="password" name="password" placeholder="������"/>
    <select required name="isAdmin">
        <option value="true">�������������</option>
        <option value="false">�� �������������</option>
    </select>
    <input type="hidden" name="addNewUser" value="qwe"/>
    <input type="submit" value="�������� ������������"/>
</form>
</body>
</html>
