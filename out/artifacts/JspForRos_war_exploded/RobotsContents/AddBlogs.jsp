<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../wangEditor-3.1.1/release/wangEditor.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.min.js"></script>
</head>
<body background="../images/222.png">
    <div style="width: 1500px;height: 700px; margin: 0 auto;margin-top: 50px; background: whitesmoke">
        <form action="../usersOperator/ReadMyBlogs.jsp" method="post">
            <br><br><br>
            <h2 style=" text-align: center; ">博客标题:</h2>
            <input type="text" name="Title" style="margin-left: 600px;width: 300px">
            <h2 style=" text-align: center; ">博客内容:</h2>
            <input type="text" name="content" style="margin-left: 600px;width: 300px">

            <br><br><br><br><br>
            <div align="center">
                <input type="submit" class="btn-outline-success"  onclick="sendToBlogs()" value="发   表">
                <%--<button id="btn1" onclick="sendToBlogs()">发    表</button>--%>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" class="btn-outline-danger" value="取   消">

                <input type="text" id="kk" name="content" hidden>
            </div>
        </form>
    </div>
</body>
    <script type="text/javascript" src="/wangEditor-3.1.1/release/wangEditor.js"></script>
    <script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    editor.create()

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html())
    }, false)

    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false)
</script>
<script>
    function sendToBlogs(){

        $('#kk').val(editor.txt.html())
    }
</script>
</html>
