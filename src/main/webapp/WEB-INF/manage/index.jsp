<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="../../resources/css/style.css" />
    <script type="text/javascript" src="../../resources/scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../resources/scripts/function.js"></script>
    <meta charset="utf-8"/>
</head>
<body>
<%--
<div id="welcomeImage">
    <img width="100%" height="150" src="/resources/images/banner.jpg" alt="welcome">
</div>
--%>
<div id="header" class="wrap">
    <div id="logo"><img src="/resources/images/logo.gif" /></div>
    <div class="help"><a href="../../page/shopping.jsp" id="shoppingBag" class="shopping">购物车X件</a>
        <a href="../../page/login.jsp">登录</a>
        <a class="button" id="logout" href="javascript:void(0);">注销</a><a href="../../page/register.jsp">注册</a>
        <a href="../../page/guestbook.jsp">留言</a><a href="../../page/index.jsp">后台管理</a></div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current"><a href="#">首页</a></li>
            <li><a href="#">图书</a></li>
            <li><a href="#">百货</a></li>
            <li><a href="#">品牌</a></li>
            <li><a href="#">促销</a></li>
        </ul>
    </div>
</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <li class="first"><a href="#">音乐</a></li>
            <li><a href="#">影视</a></li>
            <li><a href="#">少儿</a></li>
            <li><a href="#">动漫</a></li>
            <li><a href="#">小说</a></li>
            <li><a href="#">外语</a></li>
            <li><a href="#">数码相机</a></li>
            <li><a href="#">笔记本</a></li>
            <li><a href="#">羽绒服</a></li>
            <li><a href="#">秋冬靴</a></li>
            <li><a href="#">运动鞋</a></li>
            <li><a href="#">美容护肤</a></li>
            <li><a href="#">家纺用品</a></li>
            <li><a href="#">婴幼奶粉</a></li>
            <li><a href="#">饰品</a></li>
            <li class="last"><a href="#">Investor Relations</a></li>
        </ul>
    </div>
</div>
<div id="main" class="wrap">
    <div class="lefter">
        <div class="box">
            <h2>商品分类</h2>
            <dl>
                <dt>图书音像</dt>
                <dd><a href="product-list.html">图书</a></dd>
                <dd><a href="product-list.html">音乐</a></dd>
                <dt>百货</dt>
                <dd><a href="product-list.html">运动健康</a></dd>
                <dd><a href="product-list.html">服装</a></dd>
                <dd><a href="product-list.html">家居</a></dd>
                <dd><a href="product-list.html">美妆</a></dd>
                <dd><a href="product-list.html">母婴</a></dd>
                <dd><a href="product-list.html">食品</a></dd>
                <dd><a href="product-list.html">手机数码</a></dd>
                <dd><a href="product-list.html">家具首饰</a></dd>
                <dd><a href="product-list.html">手表饰品</a></dd>
                <dd><a href="product-list.html">鞋包</a></dd>
                <dd><a href="product-list.html">家电</a></dd>
                <dd><a href="product-list.html">电脑办公</a></dd>
                <dd><a href="product-list.html">玩具文具</a></dd>
                <dd><a href="product-list.html">汽车用品</a></dd>
            </dl>
        </div>
        <div class="spacer"></div>
        <div class="last-view">
            <h2>最近浏览</h2>
            <dl class="clearfix">
                <dt><img src="/resources/images/product/10_small.jpg" /></dt>
                <dd><a href="product-view.html"  target="_self">利仁2018M福满堂电饼铛 好用实惠</a><a href="product-view.html"></a></dd>
                <dt>&nbsp;</dt>
                <dd>&nbsp;</dd>
            </dl>
        </div>
    </div>
    <div class="main">
        <div class="price-off">
            <div class="slideBox">
                <ul id="slideBox">
                    <li><img src="/resources/images/product/banner_1.jpg"/></li>
                    <li><img src="/resources/images/product/banner_2.jpg"/></li>
                    <li><img src="/resources/images/product/banner_3.jpg"/></li>
                    <li><img src="/resources/images/product/banner_4.jpg"/></li>
                </ul>
            </div>
            <h2>商品列表</h2>
            <ul class="product clearfix">
                <c:forEach items="${product.datas}" var="i">
                <li>
                    <dl>
                        <dt><a href="product-view.html"  target="_self"><img src="${i.filePath}" /></a></dt>
                        <dd class="title"><a href="product-view.html" target="_self">${i.p_name}</a></dd>
                        <dd class="price">${i.price}</dd>
                    </dl>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="side">
            <div class="spacer"></div>
            <div class="news-list">
                <h4>新闻动态</h4>
                <ul>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                    <li><a href="news-view.html"  target="_self">抢钱啦</a></li>
                </ul>
            </div>
        </div>
        <div style="margin-left: 540px;margin-top: 520px;position: absolute;">
            <ul class="clearfix">
                <li style="float: left;"><a href="/homePage/show?pageIndex=1" >首页</a></li>
                <c:forEach begin="${product.pageIndex}" end="${product.pageIndex+8}" step="1" var="i">
                    <c:if test="${i<=product.totalPage}">
                        <li style="float: left;margin-left: 5px;"><a href="/homePage/show?pageIndex=${i}">${i}</a></li>
                    </c:if>
                </c:forEach>
                <li style="float: left;"><a href="/homePage/show?pageIndex=${product.totalPage}">尾页</a></li>
            </ul>
        </div>
        <div class="spacer clear"></div>
    </div>
</div>
<div id="footer">
    Copyright &copy; 2015 easybuy All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
