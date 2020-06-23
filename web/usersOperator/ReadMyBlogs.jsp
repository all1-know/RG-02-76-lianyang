<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>博客正文阅读</title>
    <link rel="stylesheet" type="text/css" href="../css/BlogsContent.css">
    <link rel="stylesheet" type="text/css" href="../css/Message.css">
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String content = request.getParameter("content");
    String Title = request.getParameter("Title");
    Date date = new Date();
    String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//将时间格式转换成符合Timestamp要求的格式.
%>
<div>
    <jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
    <%
        try{
        String BlogTitle = request.getParameter("BlogTitle");
        String sql = "insert into blogsinfo values('"+ session.getAttribute("USERNOW") +"','"+ Title +"','"+ content +"','"+ nowTime +"')";
        dbo.insert(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
    <h3>The Paper Presents</h3>
    <h1><%=request.getParameter("Title")%></h1>
    <h3> By <%=session.getAttribute("USERNOW")%></h3>
    <%=content%>

</div>
</body>
</html>
