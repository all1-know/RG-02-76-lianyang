<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>删除影片</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <script src="http://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
<br>
<hr noshade>
<div align="center">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td width="22%">
                <a href="SearchMoviesinfo.jsp" target="main">电影信息查询</a>
            </td>
            <td width="22%">
                <a href="UpdateMovies.jsp" target="main">电 影 信 息 修 改</a>
            </td>
            <td width="22%">
                <a href="AddMovie.jsp" target="main">添  加  电  影</a>
            </td>
            <td width="22%">
                删  除  电  影
            </td>

        </tr>
    </table>
</div>


<div class="table-users">
    <div class="header">删 除 电 影 信 息</div>
    <table>
        <tr>
            <th>电影图片</th>
            <th>电影名称</th>
            <th>年代</th>
            <th>简述</th>
            <th>是否删除</th>
        </tr>
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from movieinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
                session.setAttribute("Image", rs.getString("Image"));
                session.setAttribute("Name", rs.getString("Name"));
                session.setAttribute("year", rs.getString("year"));
                session.setAttribute("Description", rs.getString("Description"));
        %>
        <tr>
            <td><img src="../<%=rs.getString("Image")%>" alt="" />
            <td><%=rs.getString("Name")%></td>
            <td><%=rs.getString("year")%></td>
            <td><%=rs.getString("Description")%></td>
            <td><a class="btn btn-outline-danger" href="DataBaseDeleteMovies.jsp?Name=<%=rs.getString("Name")%>"  target="main">删    除</a></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>
