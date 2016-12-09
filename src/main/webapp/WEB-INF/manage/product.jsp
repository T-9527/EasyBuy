<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../resources/css/style.css" />
<script type="text/javascript" src="../resources/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../resources/scripts/function.js"></script>
	<style type="text/css">
		#tr:hover{
			background: cadetblue;
		}
	</style>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../resources/images/logo.gif" /></div>
	<div class="help"><a href="../index.html">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="../../page/index.jsp">首页</a></li>
			<li><a href="user.html">用户</a></li>
			<li class="current"><a href="product.jsp">商品</a></li>
			<li><a href="order.html">订单</a></li>
			<li><a href="guestbook.html">留言</a></li>
			<li><a href="news.html">新闻</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		<%
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date=sdf.format(new Date());
		%>
		管理员pillys您好，今天是<%=date%>，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="../../page/index.jsp">易买网</a> &gt; 管理后台
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><a href="user.html">用户管理</a></dd>
			  <dt>商品信息</dt>
				<dd><em><a href="/product/addCategory">新增</a></em><a href="/product/categoryManage">分类管理</a></dd>
				<dd><em><a href="/product/add">新增</a></em><a href="/product/productPage">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="order.html">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="guestbook.html">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="news-add.html">新增</a></em><a href="news.html">新闻管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>商品管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>编号</th>
					<th>商品名称</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${l.datas}" var="li">
				<tr id="tr">
					<td class="first w4 c">${li.id}</td>
					<td class="thumb"><img src="${li.filePath}" width="40px" height="27px"/><a href="../product-view.html" target="_self">${li.p_name}</a></td>
					<td class="w1 c"><a href="/product/modify/${li.id}">修改</a>
						<a class="manageDe" href="/product/delete/${li.id}" onclick="confirm('是否删除！')">删除</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="clear"></div>
    <div class="pager">
				<ul class="clearfix">
					<li><a href="/product/productPage?pageIndex=1" >首页</a></li>
					<c:forEach begin="${l.pageIndex}" end="${l.pageIndex+8}" step="1" var="i">
						<c:if test="${i<=l.totalPage}">
							<li class="current"><a href="/product/productPage?pageIndex=${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					<li><a href="/product/productPage?pageIndex=${l.totalPage}">尾页</a></li>
				</ul>
			</div>
</div>
<div id="footer">
	Copyright &copy; 2013 easybuy All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
