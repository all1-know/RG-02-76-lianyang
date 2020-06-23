<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../css/main.css">
    <link type="text/css" rel="stylesheet" href="../css/news.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/news.js"></script>

</head>
<body bgcolor="#8a2be2">
<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel" data-interval="3000">
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">

        <div class="item active">
            <img src="../images/robot3.jpg" width="671" height="447" alt="First slide">
        </div>
        <div class="item ">
            <img src="../images/robot4.jpg" width="671" height="447" alt="First slide">
        </div>
        <div class="item">
            <img src="../images/robot1.jpg" width="671" height="447" alt="Second slide">
        </div>
        <div class="item">
            <img src="../images/robot2.jpg" width="671" height="447" alt="Third slide">
        </div>
    </div>
    <img src="../images/01 .png" width="100%" height="25">

    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
    <%--<div class="container">--%>
<h1 align="center" >即将上映影片</h1>
        <div class="row small-up-10">
            <div class="box" style=" background:#ffdc28">
                <h3>黑寡妇</h3>
                <h5>《黑寡妇》将在2020年跟大家见面，她是漫威最性感的女英雄，拥有逆天的颜值。</h5>
                <a href="../video/1.mp4" style="right: auto">
                    <image src="../images/1.jpg" width="180" height="180"></image></a>
            </div>
            <div class="box" style=" background:#ffdc28">
                <h3>奇异博士2</h3>
                <h5>《奇异博士2》将在2021年跟大家见面，他是用魔法打通漫威宇宙的超级英雄。</h5>
                <a href="../video/2.mp4" style="right: auto">
                    <image src="../images/2.jpg" width="180" height="180"></image></a>
            </div>
            <div class="box" style=" background:#ffdc28">
                <h3>永恒族</h3>
                <h5>《永恒族》将于2020年跟大家见面，他是古老的宇宙种创造的一支拥有超能力的种族。</h5>
                <a href="../video/3.mp4" style="right: auto">
                    <image src="../images/3.jpg" width="180" height="180"></image></a>
            </div>
            <br><br>
            <div class="box" style=" background:#ffdc28">
                <h3>蜘蛛侠3</h3>
                <h5>《蜘蛛侠3》将于2021年跟大家见面，他是一个不完美但也不亚于任何超级英雄。</h5>
                <a href="../video/4.mp4" style="right: auto">
                    <image src="../images/4.jpg" width="180" height="180"></image></a>
            </div>
            <div class="box" style=" background:#ffdc28">
                <h3>雷神4</h3>
                <h5>《雷神4》将于2021年跟大家见面，他是一个挥舞着铁锤的超级英雄。</h5>
                <a href="../video/5.mp4" style="right: auto">
                    <image src="../images/5.jpg" width="180" height="180"></image></a>
            </div>
            <div class="box" style=" background:#ffdc28">
                <h3>黑豹2</h3>
                <h5>《黑豹2》将于2020跟大家见面，他是漫威首个非洲裔英雄，且取得了巨大的成功。</h5>
                <a href="../video/6.mp4" style="right: auto">
                    <image src="../images/6.jpg" width="180" height="180"></image></a>
            </div>
        </div>
<br><br><br>
            <h1 align="center">敬请期待更多影片...</h1></a>
    <%--<a class="replayButton" href="javascript:replay();">Reload</a>--%>
</body>
</html>
