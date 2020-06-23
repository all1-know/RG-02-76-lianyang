<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加电影</title>
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
                <a href="SearchMovieinfo.jsp" target="main">电 影 信 息 查 询</a>
            </td>
            <td width="22%">
                <a href="UpdateMovies.jsp" target="main">电 影 信 息 修  改</a>
            </td>
            <td width="22%">
                添  加  电 影
            </td>
            <td width="22%">
                <a href="DeleteMovie.jsp" target="main">删  除  电  影</a>
            </td>

        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <div class="header">添加电影信息</div>
    <form action="../images/PhotoServlet2" method="post"  enctype=multipart/form-data >

        <table>
            <%request.setCharacterEncoding("UTF-8");%>
            <tr>
                <td>电影</td>
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
            <tr>
                <td style="text-align:right;">图片预览</td>
                <td > <img id="portrait" class="img" src="" style="height: 120px;width: 100px" /></td>
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
</body>
<script>
    //JQuery实现图片上传时的图片预览功能
    $(".imgInput").change(function(){
        $(".img").attr("src",URL.createObjectURL($(this)[0].files[0]));
    });
</script>
</html>
