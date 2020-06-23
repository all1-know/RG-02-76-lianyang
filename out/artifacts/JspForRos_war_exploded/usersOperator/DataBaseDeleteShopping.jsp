<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>影片删除</title>
</head>
<body>
<jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
<%
    try {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sql = "delete from tvlikeinfo where Name = '" + request.getParameter("Name") + "' and UserName = '"+ session.getAttribute("USERNOW") +"'";
        dbo.delete(sql);
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<%
    try {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sql = "delete from movielikeinfo where Name = '" + request.getParameter("Name") + "' and UserName = '"+ session.getAttribute("USERNOW") +"'";
        dbo.delete(sql);
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<jsp:forward page="SearchMyShopping.jsp"/>
</body>
</html>
