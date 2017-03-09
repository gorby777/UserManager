<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
  <title>UserData</title>

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
<h3 align="center">User details</h3>

<table class="tg" align = "center">
  <tr>
    <th width="40">Id</th>
    <th width="120">Name</th>
    <th width="40">Age</th>
    <th width="40">Admin</th>
    <th width="140">Date</th>
    <th width="40">Edit</th>
    <th width="40">Delete</th>
  </tr>
    <tr>
      <td align="center">${user.id}</td>
      <td align="center">${user.name}</td>
      <td align="center">${user.age}</td>
      <td align="center">${user.admin}</td>
      <td align="center">${user.date}</td>
      <td align="center"><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
      <td align="center"><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
    </tr>

</table>
</body>
</html>