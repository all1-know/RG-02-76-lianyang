<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/22
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>修改电影信息</title>
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <script src="http://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
<hr noshade>
<div class="table-users">
    <div class="header">修改电影信息</div>
    <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
        String Name = request.getParameter("Name");
        Connection con=null;
        ResultSet rs=null;
        Statement stmt=null;
        con = dbo.getConnection();
        stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
       	                            ResultSet.CONCUR_READ_ONLY);
        rs=stmt.executeQuery("select * from movieinfo where Name='"+Name+"'");
        session.setAttribute("Name", request.getParameter("Name"));
        while (rs.next()){
            session.setAttribute("Image", rs.getString("Image"));
            session.setAttribute("Name", rs.getString("Name"));
            session.setAttribute("year", rs.getString("year"));
            session.setAttribute("Description", rs.getString("Description"));
        }
    %>
    <form action="DataBaseUpdateMovies.jsp" method="post">
        <table>
            <tr>
                <td>电影图片</td>
                <td><input type="text" name="Image" value="<%=session.getAttribute("Image")%>"></td>
            </tr>
            <tr>
                <td>电影名称</td>
                <td><input type="text" name="Name" value="<%=session.getAttribute("Name")%>"></td>
            </tr>
            <tr>
                <td>年代</td>
                <td><input type="text" name="year" value="<%=session.getAttribute("year")%>"></td>
            </tr>
            <tr>
                <td>简述</td>
                <td><input type="text" name="Description" value="<%=session.getAttribute("Description")%>"></td>
            </tr>
        </table>
        <center>
            <tr align="center">
                <td colspan="2">
                    <input type="submit" name="sure" value="修     改">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="clear" value="取     消">
                </td>
            </tr>
        </center>
    </form>
</body>
</html>
