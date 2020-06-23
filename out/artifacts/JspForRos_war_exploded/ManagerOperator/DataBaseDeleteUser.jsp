<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>删除用户数据库处理界面</title>
</head>
<body>
<jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
<%
        try {
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            String sql = "delete from userinfo where Email = '" + request.getParameter("Email") + "'";
            dbo.delete(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
%>
<jsp:forward page="DeleteUser.jsp"/>
</body>
</html>
