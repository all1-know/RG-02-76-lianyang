<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018/12/15
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库添加博客</title>
    <link rel="stylesheet" type="text/css" href="../css/Message.css">

</head>
<body>
    <jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
    <%
        try{
            //解决Message传入后乱码问题
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            String BlogTitle = request.getParameter("Title");
            String BlogContent = request.getParameter("Message");
            Date date = new Date();
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//将时间格式转换成符合Timestamp要求的格式.
            String sql = "insert into blogsinfo values('"+ session.getAttribute("USERNOW") +"','"+ BlogTitle +"','"+ BlogContent +"','"+ nowTime +"')";
            dbo.insert(sql);
        }catch(Exception e){
            e.printStackTrace();
        }
    %>
        <div class="shade">
            <div class="blackboard">
                <div class="form">
                    <p>
                        <h1>博客发表成功！</h1>
                    </p>

                    <p class="wipeout">
                        <a class="btn-outline-dark" href="../RobotsContents/AddBlogs.jsp" target="main">继续添加</a>
                        <a class="btn-outline-dark" href="ReadMyBlogs.jsp?BlogTitle=<%=request.getParameter("Title")%>" target="main">查 看 博 客</a>
                    </p>
                </div>
            </div>
        </div>
</body>
</html>
