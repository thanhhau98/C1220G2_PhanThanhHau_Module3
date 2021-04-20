<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/19/2021
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new service</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new service</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/services">Back to list service</a>
</p>
<form method="post">
    <fieldset>
        <legend>Service information</legend>
        <table>
            <tr>
                <td>service_id: </td>
                <td><input type="text" name="service_id" id="service_id"></td>
            </tr>
            <tr>
                <td>service_name: </td>
                <td><input type="text" name="service_name" id="service_name"></td>

<%--                <td><select  name="customer_type_id" id="customer_type_id">--%>
<%--                    <c:forEach items="${typeCustomers}" var="typeCustomer">--%>
<%--                        <option value="${typeCustomer.getTypeCustomerId()}">${typeCustomer.getTypeCustomerName()}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select></td>--%>
            </tr>
            <tr>
                <td>service_area: </td>
                <td><input type="text" name="service_area" id="service_area"></td>
            </tr>
            <tr>
                <td>service_cost: </td>
                <td><input type="text" name="service_cost" id="service_cost"></td>
            </tr>
            <tr>
                <td>service_max_people: </td>
                <td><input type="text" name="service_max_people" id="service_max_people"></td>
<%--                <td><input type="radio" name="customer_gender" value="Male" id="customer_male">Male</td>--%>
<%--                <td><input type="radio" name="customer_gender" value="Female" id="customer_female">Female</td>--%>
            </tr>
            <tr>
                <td>rent_type_id: </td>
                <td><input type="text" name="rent_type_id" id="rent_type_id"></td>
            </tr>
            <tr>
                <td>service_type_id: </td>
                <td><input type="text" name="service_type_id" id="service_type_id"></td>
            </tr>
            <tr>
                <td>standard_room: </td>
                <td><input type="text" name="standard_room" id="standard_room"></td>
            </tr>
            <tr>
                <td>description_other_convenience: </td>
                <td><input type="text" name="description_other_convenience" id="description_other_convenience"></td>
            </tr>
            <tr>
                <td>poll_area: </td>
                <td><input type="text" name="poll_area" id="poll_area"></td>
            </tr>
            <tr>
                <td>number_of_floors: </td>
                <td><input type="text" name="number_of_floors" id="number_of_floors"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create service"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
