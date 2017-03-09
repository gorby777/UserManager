<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User list by Name</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<form action="/userList">
    <button type="submit" class = "tg" >< Back to User list</button>
</form>
<h4 align="center">Users by Name details</h4>
    <table align="center">
        <tr>
            <table class="tg" align="center">
                <tr>
                    <th width="40">Id</th>
                    <th width="130">Name</th>
                    <th width="40">Age</th>
                    <th width="40">Admin</th>
                    <th width="150">Date</th>
                    <th width="40">Edit</th>
                    <th width="40">Delete</th>
                </tr>
                <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td align="center">${user.id}</td>
                        <td align="center">${user.name}</td>
                        <td align="center">${user.age}</td>
                        <td align="center">${user.admin}</td>
                        <td align="center">${user.date}</td>
                        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </tr>
        <tr>
            <table width="550" align = "center">
                <c:url var="prevAction1" value='prev1'/>
                <c:url var="nextAction1" value='next1'/>
                <tr>
                    <td align="right">
                        <form:form action="${prevAction1}">
                            <input type = "submit" class = "tg" name="prev1" value = "<Prev">
                        </form:form>
                    </td>
                    <td>
                        <form:form action="${nextAction1}">
                            <input type = "submit" class = "tg" name="next1" value = "Next>">
                        </form:form>
                    </td>
                </tr>
            </table>
        </tr>
    </table>
</body>
</html>
