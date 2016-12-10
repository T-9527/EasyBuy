<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/9
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销量</title>
    <script src="../../resources/echarts/echarts.min.js"></script>
    <script src="../../resources/scripts/jquery-1.8.3.min.js"></script>
    <style type="text/css">
        *{
            margin: 0 auto;
        }
        #product{
            width: 600px;
            height: 500px;
            float: left;
        }
        #category{
            width: 600px;
            height: 500px;
            float: left;
            margin-left: 50px;
        }
        button{
            margin-top: 300px;
            width: 80px;
            height:30px;
            font-size: 23px;
            background: olive;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
        <div id="product"></div>
        <div id="category"></div><br>
    <button id="btn">刷新</button>
<script type="text/javascript">
    $('#btn').click(function () {
        $.ajax({
             type:'POST',
             url:'/salesVolumeAjax',
             dataType:'JSON',
             success:function (data) {

             },
             error:function () {
                 alert("获取数据失败，请重新刷新！");
             }
        });
    });
    var myChart = echarts.init(document.getElementById('product'));
    var option = {
        title: {
            text: '编程语言排行榜'
        },
        tooltip: {},
        legend: {
            data:['从业人数(万)']
        },
        xAxis: {
            data: ["java","c/c++","python","html5","php","ios"]
        },
        yAxis: {},
        series: [{
            name: '从业人数(万)',
            type: 'bar',
            data: [30, 20, 36, 10, 14, 20]
        }]
    }
    myChart.setOption(option);

    var myChart = echarts.init(document.getElementById('category'));
    var option = {
        title: {
            text: '编程语言排行榜'
        },
        tooltip: {},
        legend: {
            data:['从业人数(万)']
        },
        xAxis: {
            data: ["java","c/c++","python","html5","php","ios"]
        },
        yAxis: {},
        series: [{
            name: '从业人数(万)',
            type: 'bar',
            data: [30, 20, 36, 10, 14, 20]
        }]
    }
    myChart.setOption(option);
</script>
</body>
</html>
