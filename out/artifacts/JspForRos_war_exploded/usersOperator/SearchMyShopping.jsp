<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>我的影片</title>
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
                <a href="SearchMyInfo.jsp" target="main">个 人 信 息 查 询</a>
            </td>
            <td width="22%">
                <a href="UpdateMyInfo.jsp" target="main">个 人 信 息 修 改</a>
            </td>
            <td width="22%">
                <a href="BlogsManage.jsp" target="main">博 客 管 理</a>
            </td>
            <td width="22%">
                影片收藏
            </td>
            <td>
                <a href="MessageOperator.jsp" target="main">留言管理</a>
            </td>
        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
    <%
        String Email=request.getParameter("Email");
        Connection con=null;
        ResultSet rs=null;
        ResultSet rs1=null;
        Statement stmt=null;
        con = dbo.getConnection();
        stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        rs=stmt.executeQuery("select * from tvlikeinfo where userName='"+session.getAttribute("USERNOW")+"'");
        while (rs.next()) {
    %>
    <br><br>
    <table>
            <tr>
                <td width="200" height="70">美剧</td>
                <td><img src="../<%=rs.getString("Image")%>"></td>
            </tr>
            <tr>
                <td height="70">名称</td>
                <td><%=rs.getString("Name")%></td>
            </tr>
            <tr>
                <td height="70">上映时间</td>
                <td><%=rs.getString("year")%></td>
            </tr>
            <tr>
                <td height="70">描述</td>
                <td><%=rs.getString("Description")%></td>
            </tr>
            <tr>
                <td>
                <a class="btn btn-outline-danger"  href="DataBaseDeleteShopping.jsp?Name=<%=rs.getString("Name")%>" target="main" style="margin: 0 auto;">删    除</a>
                </td>
            </tr>

    </table>
    <br><br>

    <%
        }
    %>
<%
    rs1=stmt.executeQuery("select * from movielikeinfo where userName='"+session.getAttribute("USERNOW")+"'");
    while (rs1.next()) {
%>
    <br><br>
    <table>
        <tr>
            <td width="200" height="70">电影</td>
            <td><img src="../<%=rs1.getString("Image")%>"></td>
        </tr>
        <tr>
            <td height="70">名称</td>
            <td><%=rs1.getString("Name")%></td>
        </tr>
        <tr>
            <td height="70">上映时间</td>
            <td><%=rs1.getString("year")%></td>
        </tr>
        <tr>
            <td height="70">描述</td>
            <td><%=rs1.getString("Description")%></td>
        </tr>
        <tr>
            <td>
                <a class="btn btn-outline-danger"  href="DataBaseDeleteShopping.jsp?Name=<%=rs1.getString("Name")%>" target="main" style="margin: 0 auto;">删    除</a>
            </td>
        </tr>

    </table>
    <br><br>

    <%
        }
    %>
</div>
</body>
</html>