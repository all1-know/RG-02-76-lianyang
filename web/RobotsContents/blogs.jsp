<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>博客界面</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/blogs.css">

    <link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.0/css/foundation.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/easing/EasePack.min.js"></script>
</head>
<body>

<form action="BlogsContent.jsp" method="post">
    <div class="container">
        <h4 style="font-size: 3em">博 客 首 页</h4>
        <div class="row small-up-1 medium-up-2 large-up-3">
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
    <%
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            String sql = "select * from blogsinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
    %>
            <div class="column column-block">
                <div class="card">
                    <a class="read-more" href="BlogsContent.jsp?BlogTitle=<%=rs.getString("BlogTitle")%>">
                        <div class="content">
                            <span class="date" style="font-size: 1em; color: #343b44"><%=rs.getString("Time")%></span>
                            <h3><%=rs.getString("BlogTitle")%></h3>
                            <span class="read-more">Read more</span>
                        </div>
                    </a>
                </div>
            </div>
            <%
                }
                rs.close();
            %>
        </div>
    </div>
</form>

</body>
</html>
