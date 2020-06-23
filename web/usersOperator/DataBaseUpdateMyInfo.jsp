<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>数据库修改个人信息</title>
</head>
<body>
<jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
<%
    try{
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        dbo.update("Update userinfo set userName = '"+request.getParameter("userName") +"' where Email = '"+ session.getAttribute("Email") +"'");
        dbo.update("Update userinfo set Email = '"+request.getParameter("Email") +"' where userName = '"+ session.getAttribute("userName") +"'");
        dbo.update("Update userinfo set Telephone = '"+request.getParameter("Telephone") +"' where Email = '"+ session.getAttribute("Email") +"'");
        dbo.update("Update userinfo set Age = '"+request.getParameter("Age") +"' where Email = '"+ session.getAttribute("Email") +"'");
        dbo.update("Update userinfo set Password = '"+request.getParameter("Password") +"' where Email = '"+ session.getAttribute("Email") +"'");
    }catch (Exception e){
        e.printStackTrace();
    }

%>
<jsp:forward page="UpdateMyInfo.jsp"/>
</body>
</html>
