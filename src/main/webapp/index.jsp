<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8"%>

<html>
<head>
  <title>UserManager</title>
</head>
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
</style>
<body>
<table align="center">
<h4 align="center">User: Create-Read-Update-Delete</h4>
  <tr>
    <td>
      <form action="create">
        <button type="submit" class = "tg" >Press to run Web</button>
      </form>
    </td>
      <td>
          <form action="toJar">
              <button type = "submit" class = "tg" >Press to run Jar</button>
          </form>
      </td>
  </tr>
</table>
</body>
</html>