<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../wangEditor-3.1.1/release/wangEditor.css">

    <script src="/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form action="test3.1.jsp" method="post">
    <h3>博客标题:</h3>
    <textarea name="Title"></textarea>
    <h3>博客内容:</h3>
    <div id="div1">
    </div>
    <button id="btn1" onclick="sendToBlogs()">获取html</button>
    <button id="btn2">获取text</button>
    <input type="text" id="kk" name="content" hidden>



</form>


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

    // function sendToBlogs(){
    //
    //     $('#kk').val(editor.txt.html())
    // }
    var content = editor.txt.text()
    $.ajax({
        type:"POST",
        url:"test3.1.jsp",
        async:false,
        dataType:"json",
        data:{
            content:content,
        },
        success:function (ret) {
            if(ret["result"]){
                console.log("发表成功！")
            }
        }
    })

</script>
</html>
