<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018/12/10
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
    <title>修改美剧界面</title>
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
                <a href="SearchGoodsinfo.jsp" target="main">美剧信息查询</a>
            </td>
            <td width="22%">
                美 剧 信 息 修 改
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
<hr noshade>
<div class="table-users">
    <div class="header">美 剧 信 息</div>
    <table>
        <tr>
            <th>美剧图片</th>
            <th>美剧名称</th>
            <th>年代</th>
            <th width="150">商品简述</th>
            <th>是否修改</th>
        </tr>
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from tvinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
        %>
        <tr>
            <td><img src="../<%=rs.getString("Image")%>" ></td>
            <td><%=rs.getString("Name")%></td>
            <td><%=rs.getString("year")%></td>
            <td><%=rs.getString("Description")%></td>
            <td><a class="btn btn-outline-success"  href="UpdateGoodsInfo.jsp?Name=<%=rs.getString("Name")%>" target="main">修  改</a></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>