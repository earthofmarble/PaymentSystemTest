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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>���������� ������������</h1>
</div>
<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>����� ������������:</h2>
        </div>
<form action = "/admin" method="post" class="w3-selection w3-light-grey w3-padding">
    <input class="w3-input w3-animate-input w3-border w3-round-large"  required type="text" name="name" placeholder="���"/>
    <input class="w3-input w3-animate-input w3-border w3-round-large" required type="text" name="secondName" placeholder="�������"/>
    <input class="w3-input w3-animate-input w3-border w3-round-large"  required type="text" name="login" placeholder="�����"/>
    <input class="w3-input w3-animate-input w3-border w3-round-large"  required type="password" name="password" placeholder="������"/>
    <select required name="isAdmin">
        <option class="w3-input w3-animate-input w3-border w3-round-large"  value="true">�������������</option>
        <option class="w3-input w3-animate-input w3-border w3-round-large"  value="false">�� �������������</option>
    </select>
    <input type="hidden" name="addNewUser" value="qwe"/>
    <input type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom" value="�������� ������������"/>
</form>
</body>
</html>
