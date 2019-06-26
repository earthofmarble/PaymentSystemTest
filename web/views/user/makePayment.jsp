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
</head>
<body>
Перевод средств
<form action = "/personal" method="post">
    <label>
        <select name="personalAccountNumber">
            <c:forEach items="${userAccounts}" var = "account">
                <c:if test="${account.isBlocked()==false && account.getBalance()>0}"><option value="${account.getId()}">Счет: ${account.getNumber()} Баланс: <fmt:formatNumber type="number" maxFractionDigits="2" value="${account.getBalance()}"/></option></c:if>
            </c:forEach>
        </select>
    </label>
    <input required type="number" name="moneyAmount" placeholder="Сумма перевода"/>
    <input required type="number" name="recipientAccountNumber" placeholder="Номер счета получателя"/>
    <input type="hidden" name="payment" value="qwe"/>
    <input type="hidden" name="balance" value="${account.getBalance()}"/>

    <input type="submit" value="Совершить платёж"/>
</form>
</body>
</html>
