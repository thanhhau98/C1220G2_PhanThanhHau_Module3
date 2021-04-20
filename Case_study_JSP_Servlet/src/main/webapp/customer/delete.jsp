<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/19/2021
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>customer_id: </td>
                <td>${requestScope["customer"].getCustomer_id()}</td>
            </tr>
            <tr>
                <td>customer_type_id: </td>
                <td>${requestScope["customer"].getCustomer_type_id()}</td>
            </tr>
            <tr>
                <td>customer_name: </td>
                <td>${requestScope["customer"].getCustomer_name()}</td>
            </tr>
            <tr>
                <td>customer_birthday: </td>
                <td>${requestScope["customer"].getCustomer_birthday()}</td>
            </tr>
            <tr>
                <td>customer_gender: </td>
                <td>${requestScope["customer"].getCustomer_gender()}</td>
            </tr>
            <tr>
                <td>customer_id_card: </td>
                <td>${requestScope["customer"].getCustomer_id_card()}</td>
            </tr>
            <tr>
                <td>customer_phone: </td>
                <td>${requestScope["customer"].getCustomer_phone()}</td>
            </tr>
            <tr>
                <td>customer_email: </td>
                <td>${requestScope["customer"].getCustomer_email()}</td>
            </tr>
            <tr>
                <td>customer_address: </td>
                <td>${requestScope["customer"].getCustomer_address()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
