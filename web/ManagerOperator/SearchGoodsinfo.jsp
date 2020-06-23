<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>影片管理</title>
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
                美 剧 信 息 查 询
            </td>
            <td width="22%">
                <a href="UpdateGoods.jsp" target="main">美 剧 信 息 修 改</a>
            </td>
            <td width="22%">
                <a href="AddGoods.jsp" target="main">添  加  美 剧</a>
            </td>
            <td width="22%">
                <a href="DeleteGoods.jsp" target="main">删  除  美 剧</a>
            </td>

        </tr>
    </table>
</div>
<div class="table-users">
    <div class="header">美 剧 列 表</div>
    <table>
        <tr>
            <th>美剧</th>
            <th>名称</th>
            <th width="100">年代</th>
            <th width="230">简述</th>
        </tr>
        <jsp:useBean id="dbo" scope="application"  class="DBOP.DBOperator"/>
        <%
            String sql = "select * from tvinfo";
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
