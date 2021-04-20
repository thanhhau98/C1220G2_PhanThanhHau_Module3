<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/19/2021
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/boostrap/css/bootstrap.min.css">
    <script src="/boostrap/js/jquery-3.6.0.min.js"></script>
    <script src="/boostrap/js/bootstrap.min.js"></script>
    <title>Edit customer</title>
</head>
<body>
<h1>Edit customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>customer_id: </td>
                <td><input type="text" name="customer_id" id="customer_id" value="${requestScope["customer"].getCustomer_id()}"></td>
            </tr>
            <tr>
                <td>customer_type_id: </td>
                <td><select  name="customer_type_id" id="customer_type_id"  >
                    <c:forEach items="${typeCustomers}" var="typeCustomer" >
                        <c:set var="check" value="${typeCustomer.getTypeCustomerId().equals(customer.getCustomer_type_id())}"></c:set>
                        <c:if test="${check}">
                            <option selected value="${typeCustomer.getTypeCustomerId()}">${typeCustomer.getTypeCustomerName()}</option>
                        </c:if>
                        <c:if test="${!check}">
                            <option  value="${typeCustomer.getTypeCustomerId()}">${typeCustomer.getTypeCustomerName()}</option>
                        </c:if>
                    </c:forEach>
                </select>
                </td>
<%--                <td><input type="text" name="customer_type_id" id="customer_type_id" value="${requestScope["customer"].getCustomer_type_id()}"></td>--%>
            </tr>
            <tr>
                <td>customer_name: </td>
                <td><input type="text" name="customer_name" id="customer_name" value="${requestScope["customer"].getCustomer_name()}"></td>
            </tr>
            <tr>
                <td>customer_birthday: </td>
                <td><input type="text" name="customer_birthday" id="customer_birthday" value="${requestScope["customer"].getCustomer_birthday()}"></td>
            </tr>
            <tr>
                <td>customer_gender: </td>
                <c:set var="checkGender" value="${customer.getCustomer_gender()=='1'}"></c:set>
                <c:if test="${checkGender}">
                    <td><input type="radio" checked="checked" name="customer_gender" value="true" >Male</td>
                    <td><input type="radio" name="customer_gender" value="false" >Female</td>
                </c:if>
                <c:if test="${!checkGender}">
                    <td><input type="radio" name="customer_gender" value="true" >Male</td>
                    <td><input type="radio" checked="checked" name="customer_gender" value="false" >Female</td>
                </c:if>

            </tr>
            <tr>
                <td>customer_id_card: </td>
                <td><input type="text" name="customer_id_card" id="customer_id_card" value="${requestScope["customer"].getCustomer_id_card()}"></td>
            </tr>
            <tr>
                <td>customer_phone: </td>
                <td><input type="text" name="customer_phone" id="customer_phone" value="${requestScope["customer"].getCustomer_phone()}"></td>
            </tr>
            <tr>
                <td>customer_email: </td>
                <td><input type="text" name="customer_email" id="customer_email" value="${requestScope["customer"].getCustomer_email()}"></td>
            </tr>
            <tr>
                <td>customer_address: </td>
                <td><input type="text" name="customer_address" id="customer_address" value="${requestScope["customer"].getCustomer_address()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
