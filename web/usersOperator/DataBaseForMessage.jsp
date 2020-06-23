<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库留言操作</title>
</head>
<body>
<jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
<%
    try {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sql = "delete from messageinfo where Time = '" + request.getParameter("Time") + "'";
        //String sql = "delete from messageinfo where Message = '" + request.getParameter("Message") + "' and UserName = '"+ session.getAttribute("USERNOW") +"'";
        dbo.delete(sql);
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<jsp:forward page="MessageOperator.jsp"/>
</body>
</html>