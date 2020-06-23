<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影管理</title>
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
                电  影 信 息 查 询
            </td>
            <td width="22%">
                <a href="UpdateMovies.jsp" target="main">电  影  信  息  修  改</a>
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
<div class="table-users">
    <div class="header">电 影 列 表</div>
    <table>
        <tr>
            <th>电 影 图 片</th>
            <th>电 影 名 称</th>
            <th width="100">年 代</th>
            <th width="230">简 述</th>
        </tr>
        <jsp:useBean id="dbo" scope="application"  class="DBOP.DBOperator"/>
        <%
            String sql = "select * from movieinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
        %>
        <tr>
            <td><img src="../<%=rs.getString("Image")%>"/>
            </td>
            <td style="font-size:0.9em"><%=rs.getString("Name")%></td>
            <td><%=rs.getString("year")%></td>
            <td><%=rs.getString("Description")%></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>