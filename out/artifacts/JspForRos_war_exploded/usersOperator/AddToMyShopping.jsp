<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收藏影片数据库处理</title>
</head>
<body>
<jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
    <%
        try{
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            String sql = "insert tvlikeinfo values('"+ session.getAttribute("USERNOW") + "','"+ session.getAttribute("Image") +"','"+ session.getAttribute("Name") +"','"+ session.getAttribute("year") +"','"+ session.getAttribute("Description") +"')";
            dbo.insert(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<jsp:forward page="../RobotsContents/TV.jsp"/>
</body>
</html>
