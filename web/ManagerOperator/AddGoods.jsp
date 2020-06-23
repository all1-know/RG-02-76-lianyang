<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加美剧</title>
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
                <a href="SearchGoodsinfo.jsp" target="main">美 剧 信 息 查 询</a>
            </td>
            <td width="22%">
                <a href="UpdateGoods.jsp" target="main">美 剧 信 息 修  改</a>
            </td>
            <td width="22%">
                添  加  美  剧
            </td>
            <td width="22%">
                <a href="DeleteGoods.jsp" target="main">删  除  美  剧</a>
            </td>

        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <div class="header">添加美剧信息</div>
    <form action="../images/photoServlet" method="post"  enctype=multipart/form-data >

        <table>
            <%request.setCharacterEncoding("UTF-8");%>
            <tr>
                <td>美剧</td>
                <td><input type="file" name="Image" class="imgInput"></td>
            </tr>
            <tr>
                <td>名称</td>
                <td><input type="text" name="Name"></td>
            </tr>
            <tr>
                <td>年代</td>
                <td><input type="text" name="year"></td>
            </tr>
            <tr>
                <td>描述</td>
                <td><input type="text" name="Description"></td>
            </tr>
        </table>
        <center>
            <tr align="center">
                <td colspan="2">
                    <input type="submit"  name="sure" value="添     加">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="clear" value="取     消">
                </td>
            </tr>
        </center>
    </form>
</div>
</body>
</html>