<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/19/2021
  Time: 8:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<form action="/customers" method="get">
    <input type="text" name="action"  value="search" hidden>
    <input type="text" name="search" placeholder="id">
    <input type="text" name="phone" placeholder="phone">
    <input type="text" name="email" placeholder="email">
    <button type="submit">Search</button>
</form>
<p>
    <a href="/customers?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <td>customer_id</td>
        <td>customer_type_id</td>
        <td>customer_name</td>
        <td>customer_birthday</td>
        <td>customer_gender</td>
        <td>customer_id_card</td>
        <td>customer_phone</td>
        <td>customer_email</td>
        <td>customer_address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["customers"]}' var="customer">
        <tr>
            <td>${customer.getCustomer_id()}</td>

            <c:forEach items="${typeCustomers}" var="typeCustomer">
                <c:if test="${typeCustomer.getTypeCustomerId().equals(customer.getCustomer_type_id())}">
                    <td>${typeCustomer.getTypeCustomerName()}</td>
                </c:if>
            </c:forEach>

            <td><a href="/customers?action=view&id=${Customer.getCustomer_id()}">${customer.getCustomer_name()}</a></td>
            <td>${customer.getCustomer_birthday()}</td>
            <td>${customer.getCustomer_gender()}</td>
            <td>${customer.getCustomer_id_card()}</td>
            <td>${customer.getCustomer_phone()}</td>
            <td>${customer.getCustomer_email()}</td>
            <td>${customer.getCustomer_address()}</td>
            <td><a href="/customers?action=edit&id=${customer.getCustomer_id()}">edit</a></td>
            <td><a href="/customers?action=delete&id=${customer.getCustomer_id()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<form action="/customers" method="get">
    <input type="hidden" name="action" value="orderUser">
    <button type="submit">Oder</button>
</form>
</body>
</html>
