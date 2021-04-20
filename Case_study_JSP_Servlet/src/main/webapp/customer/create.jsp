<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/16/2021
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/customers">Back to list customer</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>customer_id: </td>
                <td><input type="text" name="customer_id" id="customer_id"></td>
            </tr>
            <tr>
                <td>customer_type_id: </td>

                <td><select  name="customer_type_id" id="customer_type_id">
                    <c:forEach items="${typeCustomers}" var="typeCustomer">
                        <option value="${typeCustomer.getTypeCustomerId()}">${typeCustomer.getTypeCustomerName()}</option>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>customer_name: </td>
                <td><input type="text" name="customer_name" id="customer_name"></td>
            </tr>
            <tr>
                <td>customer_birthday: </td>
                <td><input type="text" name="customer_birthday" id="customer_birthday"></td>
            </tr>
            <tr>
                <td>customer_gender: </td>
                <td><input type="radio" name="customer_gender" value="true" id="customer_male">Male</td>
                <td><input type="radio" name="customer_gender" value="false" id="customer_female">Female</td>
            </tr>
            <tr>
                <td>customer_id_card: </td>
                <td><input type="text" name="customer_id_card" id="customer_id_card"></td>
            </tr>
            <tr>
                <td>customer_phone: </td>
                <td><input type="text" name="customer_phone" id="customer_phone"></td>
            </tr>
            <tr>
                <td>customer_email: </td>
                <td><input type="text" name="customer_email" id="customer_email"></td>
            </tr>
            <tr>
                <td>customer_address: </td>
                <td><input type="text" name="customer_address" id="customer_address"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
