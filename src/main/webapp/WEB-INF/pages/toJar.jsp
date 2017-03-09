<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%
    String com = request.getParameter("command");
    if (com!=null) {
        Process process = Runtime.getRuntime().exec(com);
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Java command line</title>
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
<form action="../../index.jsp">
    <button type="submit" class = "tg" >< Back to main</button>
</form>
<table border="0"  width="30%" align="center">
  <tr><!-- Row 1 -->
     <td><i><b>Correct</b> AbsolutePath(User.jar is in project root)!</i></td><!-- Col 1 -->
  </tr>
  <tr><!-- Row 2 -->
     <td>
	 	 <form>
       	 <input type="text" name="command" value='javaw -jar F:\UserManager\User.jar' size = 50 class = "tg"/>
       	 <input type="submit" value="Run" name="run" class = "tg"/>
    	 </form>
	</td><!-- Col 1 -->
  </tr>
</table>
</body>
</html>
