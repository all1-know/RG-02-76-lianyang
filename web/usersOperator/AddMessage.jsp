<%@ page import="java.util.Date" %>
<%@ page import="java.security.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言板块数据库处理界面</title>
    <link rel="stylesheet" type="text/css" href="../css/Message.css">

</head>
<body>
    <jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
    <%
        try{
            //解决Message传入后乱码问题
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            String Title = request.getParameter("Title");
            String Message = request.getParameter("Message");
            Date date = new Date();
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//将时间格式转换成符合Timestamp要求的格式.
            String Reply = null;
            int flag = 0;
            String sql = "insert into messageinfo values('"+ session.getAttribute("USERNOW") +"','"+ Title +"','"+ Message +"','"+ nowTime +"','"+ flag +"')";
            dbo.insert(sql);
        }catch(Exception e){
            e.printStackTrace();
        }

    %>
<form action="../RobotsContents/Goods.jsp">
            <div class="blackboard">
                <div class="form">
                    <p>
                    <h1 style="color: #dc3545">留言成功！感谢提出您的宝贵意见！</h1>
                    </p>
                    <p class="wipeout">
                    <input type="submit" value="返回" />
                    </p>
        </div>
            </div>

</body>
</html>
