<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客正文阅读</title>
    <link rel="stylesheet" type="text/css" href="../css/BlogsContent.css">
    <link rel="stylesheet" type="text/css" href="../css/Message.css">
</head>
<body>
<div>
    <jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
    <%
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String Title = request.getParameter("BlogTitle");
    %>
    <%
        try{
            String sql = "select * from blogsinfo where BlogTitle = '"+ Title +"'";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
    %>
    <h3>The Paper Presents</h3>
    <h1><%=request.getParameter("BlogTitle")%></h1>
    <h3> By The Editor &amp; <%=rs.getString("userName")%></h3>
    <%=rs.getString("BlogContent")%>

    <%
        }
        rs.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>




</div>
</body>
</html>
