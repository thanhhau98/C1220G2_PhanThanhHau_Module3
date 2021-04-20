<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/19/2021
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service List</title>
</head>
<body>
<h1>Services</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<form action="/services" method="get">
    <input type="text" name="action" value="search" hidden>
    <input type="text" name="search">
    <button type="submit">Search</button>
</form>
<p>
    <a href="/services?action=create">Create new service</a>
</p>
<table border="1">
    <tr>
        <td>service_id</td>
        <td>service_name</td>
        <td>service_area</td>
        <td>service_cost</td>
        <td>service_max_prople</td>
        <td>rent_type_id</td>
        <td>service_type_id</td>
        <td>standard_room</td>
        <td>description_other_convenience</td>
        <td>poll_area</td>
        <td>number_of_floors</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["services"]}' var="service">
        <tr>
            <td>${service.getService_id()}</td>


<%--            <c:forEach items="${typeCustomers}" var="typeCustomer">--%>
<%--                <c:if test="${typeCustomer.getTypeCustomerId().equals(customer.getCustomer_type_id())}">--%>
<%--                    <td>${typeCustomer.getTypeCustomerName()}</td>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>

            <td><a href="/customers?action=view&id=${service.getService_id()}">${service.getService_name()}</a></td>
            <td>${service.getService_area()}</td>
            <td>${service.getService_cost()}</td>
            <td>${service.getService_max_people()}</td>
            <td>${service.getRent_type_id()}</td>
            <td>${service.getService_type_id()}</td>
            <td>${service.getStandard_room()}</td>
            <td>${service.getDescription_other_convenience()}</td>
            <td>${service.getPoll_area()}</td>
            <td>${service.getNumber_of_floors()}</td>
            <td><a href="/customers?action=edit&id=${service.getService_id()}">edit</a></td>
            <td><a href="/customers?action=delete&id=${service.getService_id()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<form action="/services" method="get">
    <input type="hidden" name="action" value="orderUser">
    <button type="submit">Oder</button>
</form>
</body>
</html>
