<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
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
<title>User List</title>
<body>
<form action="../../index.jsp">
    <button type="submit" class = "tg" >< Back to main</button>
</form>
<table align="center">
    <tr>
        <td>
            <table>
                <tr>
                    <c:if test="${!empty listUsers}">
                        <h4 align="center">User list</h4>
                        <table class="tg">
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
                                    <td align="center"><a href="/userData/${user.id}"
                                                          target="_blank">${user.name}</a></td>
                                    <td align="center">${user.age}</td>
                                    <td align="center">
                                        <c:if test="${user.admin}">
                                            <input type = "checkbox" checked disabled/>
                                        </c:if>
                                        <c:if test="${!user.admin}">
                                            <input type = "checkbox" disabled/>
                                        </c:if></td>
                                    <td align="center">${user.date}</td>
                                    <td align="center"><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                                    <td align="center"><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </tr>
                <tr>	
                    <table width="550" align="center">
                        <tr>
                            <td align="right">
                                <form:form>
                                    <input type = "submit" formaction='/prev' class = "tg td" name="prev" value = "<Prev"/>
                                </form:form>
                            </td>
                            <td>
                                <form:form>
                                    <input type = "submit" formaction='/next' class = "tg td" name="next" value = "Next>"/>
                                </form:form>
                            </td>
                        </tr>
                    </table>
                </tr>
            </table>
        </td>
		<br />
        <td>
            <table class="tg" align="center">
                <tr>
                    <td align = "center" valign="top">
                        <c:url var="addAction" value="/add"/>
                        <h4>Add or Edit user</h4>
                        <form:form action="${addAction}" commandName="user">
                            <table>
                                <c:if test="${!empty user.name}">
                                    <tr>
                                        <td>
                                            <form:label path="id">
                                                <spring:message text="Id"/>
                                            </form:label>
                                        </td>
                                        <td>
                                            <form:input path="id" readonly="true" size="8" disabled="true"/>
                                            <form:hidden path="id"/>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <td>
                                        <form:label path="name">
                                            <spring:message text="Name"/>
                                        </form:label>
                                    </td>
                                    <td>
                                        <form:input path="name" pattern = "\w{1,25}" placeholder="1-25 chars"
                                                    size = "25" class = "tg td"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <form:label path="age">
                                            <spring:message text="Age"/>
                                        </form:label>
                                    </td>
                                    <td>
                                        <form:input path="age" pattern = "\\d{2,3}" placeholder="DD"
                                                    size="3" class = "tg td"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <form:label path="admin">
                                            <spring:message text="Admin"/>
                                        </form:label>
                                    </td>
                                    <td>
                                        <c:if test="${user.admin}">
                                            <input type = "checkbox" checked name = "admin"/>
                                        </c:if>
                                        <c:if test="${!user.admin}">
                                            <input type = "checkbox" name = "admin"/>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <form:label path="date">
                                            <spring:message text="Date"/>
                                        </form:label>
                                    </td>
                                    <td>
                                        <form:input path="date" pattern ="\\d{4}\\/\\d{2}\\/\\d{2}"
                                                    placeholder="YYYY/MM/DD" class = "tg td"  size="10" autocomplete="false"/>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <c:if test="${!empty user.name}">
                                            <input type="submit" class = "tg"
                                                   value="<spring:message  text="Edit User"/>"/>
                                        </c:if>
                                        <c:if test="${empty user.name}">
                                            <input type="submit" class = "tg"
                                                   value="<spring:message text="Add User"/>"/>
                                        </c:if>
                                    </td>
                                </tr>
                            </table>
                        </form:form>
                    </td>
                    <td align="center" valign="top">
                        <h4>Find users by Name</h4>
                        <c:url var="findAction" value='/find'/>
                        <form:form action="${findAction}">
                            <input type= "search"  class = "tg" name="usersName" size="25">
                            <input type = "submit" class = "tg" name="find" value = "Find">
                        </form:form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
