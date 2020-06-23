<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>数据库修改美剧信息</title>
</head>
<body>
<jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
<%
    try{
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        dbo.update("Update tvinfo set Image = '"+request.getParameter("Image") +"' where Name = '"+ session.getAttribute("Name") +"'");
        dbo.update("Update tvinfo set Name = '"+request.getParameter("Name") +"' where Name = '"+ session.getAttribute("Name") +"'");
        dbo.update("Update tvinfo set year = '"+request.getParameter("year") +"' where Name = '"+ session.getAttribute("Name") +"'");
        dbo.update("Update tvinfo set Description = '"+request.getParameter("Description") +"' where Name = '"+ session.getAttribute("Name") +"'");
    }catch (Exception e){
        e.printStackTrace();
    }

%>
<jsp:forward page="UpdateGoods.jsp"/>
</body>
</html>
