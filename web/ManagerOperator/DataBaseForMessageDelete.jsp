<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>管理员删除留言数据库界面</title>
</head>
<body>
<jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
<%
    try {

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sql = "delete from messageinfo where Time = '" + request.getParameter("Time") + "'  ";
//                String sql = "delete from messageinfo where Message = '" + request.getParameter("Message") + "' and UserName = '"+ session.getAttribute("USERNOW") +"'";
        dbo.delete(sql);
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<jsp:forward page="SearchMessageInfo.jsp"/>
</body>
</html>
