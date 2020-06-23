<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>漫威电影</title>
    <link rel="stylesheet" type="text/css" href="../css/Goods.css">
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <link rel="stylesheet" type="text/css" href="../css/CutPage.css">
</head>
<body>
<div class="table-users">
    <div class="header">漫威电影</div>
    <table>
        <form action="SearchMovie.jsp" method="post">
            <tr align="center">
                按上映时间查询：&nbsp;&nbsp;&nbsp;
                <input type="input" name="year">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn-outline-success" style="">查  询</button>
            </tr>
        </form>
    </table>
    <table>
        <tr>
            <th width="150">电影</th>
            <th>名称</th>
            <th width="100">上映时间</th>
            <th width="230">简述</th>
            <th width="110">收藏</th>
        </tr>

        <jsp:useBean id="dbo" scope="application"  class="DBOP.DBOperator"/>
        <%
            String sql = "select * from movieinfo";
            ResultSet rs = dbo.select(sql);
            int intPageSize; //一页显示的记录数
            int intRowCount; //记录总数
            int intPageCount; //总页数
            int intPage; //待显示页码
            String strPage;
            int i;
            intPageSize =6; //设置一页显示的记录数
            strPage = request.getParameter("page");  //取得待显示页码
            if(strPage==null){
                //表明在QueryString中没有page这一个参数，此时显示第一页数据
                intPage = 1;
            } else{
                //将字符串转换成整型
                intPage = java.lang.Integer.parseInt(strPage);
                if(intPage<1)
                    intPage=1;
            }
            rs.last(); //光标指向查询结果集中最后一条记录
            intRowCount = rs.getRow();  //获取记录总数
            intPageCount = (intRowCount+intPageSize-1) / intPageSize;
            //记算总页数
            if(intPage>intPageCount)
                intPage = intPageCount;//调整待显示的页码
            if(intPageCount>0){
                rs.absolute((intPage-1)*intPageSize + 1);
                //将记录指针定位到待显示页的第一条记录上
                //显示数据
                i=0;
                while (i<intPageSize && !rs.isAfterLast()){
        %>


        <tr>
            <td><img src="../<%=rs.getString("Image")%>" /><%session.setAttribute("Image",rs.getString("Image"));%>
            </td>
            <td style="font-size:0.9em">
                <a href="Message.jsp?name=<%=rs.getString("Name")%>
                        <%session.setAttribute("Name",rs.getString("Name"));%>">
                       <%=rs.getString("Name")%>
                    <%session.setAttribute("Name",rs.getString("Name"));%>
                </a>
            </td>
            <td style="font-size:0.9em">
                <%=rs.getString("year")%>
                <%session.setAttribute("year",rs.getString("year"));%>
            </td>
            <td>
                <%=rs.getString("Description")%>
                <%session.setAttribute("Description",rs.getString("Description"));%>
            </td>
            <td><a class="btn btn-outline-success"  href="../usersOperator/AddToMymovie.jsp?Name=<%=rs.getString("Name")%>" target="main">收藏</a></td>
        </tr>
        <%
                    rs.next();
                    i ++;
                }
            }
        %>
    </table>
</div>
</body>
</html>

