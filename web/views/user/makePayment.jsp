<%@ page import="app.services.AccountServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: earthofmarble
  Date: 26-Jun-19
  Time: 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ОСУЩЕСТВЛЕНИЕ ПЛАТЕЖА -->

<html>
<head>
    <title>Платёж</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Перевод средств</h1>
</div>
<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>Транзакция:</h2>
        </div>
<form action = "/personal" class="w3-selection w3-light-grey w3-padding" method="post">
    <label>
        <select name="personalAccountNumber">
            <c:forEach items="${userAccounts}" var = "account">
                <c:if test="${account.isBlocked()==false && account.getBalance()>0}"><option  class="w3-input w3-animate-input w3-border w3-round-large" value="${account.getId()}">Счет: ${account.getNumber()} Баланс: <fmt:formatNumber type="number" maxFractionDigits="2" value="${account.getBalance()}"/></option></c:if>
            </c:forEach>
        </select>
    </label>
    <input required  class="w3-input w3-animate-input w3-border w3-round-large" type="number" name="moneyAmount" placeholder="Сумма перевода"/>
    <input required  class="w3-input w3-animate-input w3-border w3-round-large" type="number" name="recipientAccountNumber" placeholder="Номер счета получателя"/>
    <input type="hidden" name="payment" value="qwe"/>
    <input type="hidden" name="balance" value="${account.getBalance()}"/>

    <input type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom"  value="Совершить платёж"/>
</form>
    </div>
</div>
</body>
</html>
