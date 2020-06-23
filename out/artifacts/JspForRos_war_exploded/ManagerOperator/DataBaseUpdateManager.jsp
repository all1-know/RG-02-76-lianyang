<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>数据库修改管理员信息</title>
</head>
<body>
<jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
<%
    try{
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        dbo.update("Update managerinfo set ManagerID = '"+request.getParameter("ManagerID") +"' where ManagerID = '"+ session.getAttribute("ManagerID") +"'");
        dbo.update("Update managerinfo set ManagerName = '"+request.getParameter("ManagerName") +"' where ManagerID = '"+ session.getAttribute("ManagerID") +"'");
        dbo.update("Update managerinfo set Password = '"+request.getParameter("Password") +"' where ManagerID = '"+ session.getAttribute("ManagerID") +"'");
        dbo.update("Update managerinfo set Telephone = '"+request.getParameter("Telephone") +"' where ManagerID = '"+ session.getAttribute("ManagerID") +"'");
    }catch (Exception e){
        e.printStackTrace();
    }

%>
<jsp:forward page="UpdateManager.jsp"/>
</body>
</html>
