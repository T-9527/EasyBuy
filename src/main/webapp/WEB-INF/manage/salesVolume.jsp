<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/9
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
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
            width: 100%;
            height: 600px;
            float: left;
        }
        button{
            width: 80px;
            height:30px;
            font-size: 23px;
            background: palevioletred;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String time = simpleDateFormat.format(new Date());
%>
<a href="/user/k">跳转k</a>
<center>
        <div id="product"></div>
        <button id="btn">刷新</button><br/><br/><br/>
            <h4>上次刷新时间:<%=time%></h4>
</center>

<script type="text/javascript">
    $('#btn').click(function () {
        location.reload();
    });
    var myChart = echarts.init(document.getElementById('product'));
    var option = {
        title: {
            text: '易购网销量信息'
        },
        tooltip: {},
        legend: {
            data:['销量(万件)']
        },
        xAxis: {
            data: [ <c:forEach items="${list}" var="i">
                    '${i[1]}',
                </c:forEach>]
        },
        yAxis: {},
        series: [{
            name: '销量(万件)',
            type: 'bar',
            data: [<c:forEach items="${list}" var="i">
                    ${i[0]},
                </c:forEach>]
        }]
    }
    myChart.setOption(option);
</script>
</body>
</html>
