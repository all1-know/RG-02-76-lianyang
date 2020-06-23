<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/22
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>修改电影信息界面</title>
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
                电 影 信 息 修 改
            </td>
            <td width="22%">
                <a href="AddMovie.jsp" target="main">添  加  电  影</a>
            </td>
            <td width="22%">
                <a href="DeleteMovie.jsp" target="main">删  除  电  影</a>
            </td>

        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <div class="header">商 品 信 息</div>
    <table>
        <tr>
            <th>电影图片</th>
            <th>电影名称</th>
            <th>年代</th>
            <th width="150">简述</th>
            <th>是否修改</th>
        </tr>
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from movieinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
        %>
        <tr>
            <td><img src="../<%=rs.getString("Image")%>" ></td>
            <td><%=rs.getString("Name")%></td>
            <td><%=rs.getString("year")%></td>
            <td><%=rs.getString("Description")%></td>
            <td><a class="btn btn-outline-success"  href="UpdateMoviesInfo.jsp?Name=<%=rs.getString("Name")%>" target="main">修  改</a></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>

