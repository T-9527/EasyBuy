<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="../../resources/css/style.css" />
<script type="text/javascript" src="../../resources/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../resources/scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../../resources/images/logo.gif" /></div>
	<div class="help"><a href="../../page/shopping.jsp" class="shopping">购物车X件</a><a href="../../page/login.jsp">登录</a><a href="../../page/register.jsp">注册</a><a href="../../page/guestbook.jsp">留言</a><a href="manage/index.html">后台管理</a></div>
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
<div id="position" class="wrap">
	您现在的位置：<a href="index.html">易买网</a> &gt; <a href="product-list.jsp">图书音像</a> &gt; 图书
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>商品分类</h2>
			<dl>
				<dt>图书音像</dt>
				<dd><a href="/homePage/list/图书">图书</a></dd>
				<dd><a href="/homePage/list/音乐">音乐</a></dd>
				<dt>百货</dt>
				<dd><a href="/homePage/list/运动健康">运动健康</a></dd>
				<dd><a href="/homePage/list/服装">服装</a></dd>
				<dd><a href="/homePage/list/家居">家居</a></dd>
				<dd><a href="/homePage/list/美妆">美妆</a></dd>
				<dd><a href="/homePage/list/母婴">母婴</a></dd>
				<dd><a href="/homePage/list/食品">食品</a></dd>
				<dd><a href="/homePage/list/手机数码">手机数码</a></dd>
				<dd><a href="/homePage/list/家具首饰">家具首饰</a></dd>
				<dd><a href="/homePage/list/手表饰品">手表饰品</a></dd>
				<dd><a href="/homePage/list/鞋包">鞋包</a></dd>
				<dd><a href="/homePage/list/家电">家电</a></dd>
				<dd><a href="/homePage/list/电脑办公">电脑办公</a></dd>
				<dd><a href="/homePage/list/玩具文具">玩具文具</a></dd>
				<dd><a href="/homePage/list/汽车用品">汽车用品</a></dd>
			</dl>
		</div>
	</div>
	<div id="product" class="main">
		<h1>${product.p_name}</h1>
		<div class="infos">
			<div class="thumb"><img src="${product.filePath}" width="210" height="206" /></div>
			<div class="buy">
				商城价：<span class="price">￥${product.price}</span><br />
				库　存：
				<c:if test="${product.stock>1}">
					有货
				</c:if>
				<c:if test="${product.stock<1}">
					缺货
				</c:if>
				&nbsp;${product.stock} 件
			  <div class="button"><input type="button" name="button" value="" onclick="location.href = '../../page/address.jsp'" /><a href="../../page/shopping.jsp">放入购物车</a></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品详情</strong></h2>
			<div class="text">
				${product.discription}<br />
				......<br />
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 easybuy All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
