<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../../resources/css/style.css" />
<script type="text/javascript" src="../../resources/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../resources/scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
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
		<h2>添加分类</h2>
		<div class="manage">
			<form action="/product/addCategory" method="post" onsubmit="return fun();">
				<table class="form">
					<tr>
						<td class="field">父分类：</td>
						<td>
							<select name="parent_category.name">
								<c:forEach items="${l}" var="i">
								<option value="${i.name}">${i.name}</option>
								</c:forEach>
							</select>
						</td>
						<td id="p_category"></td>
					</tr>
					<tr>
						<td class="field">分类名称：</td>
						<td><input type="text" class="text" name="name" value="" /></td>
						<td id="category"></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
					</tr>
				</table>
			</form>
			<script>
				var a = false;
				function fun() {
					var n = $(".text:eq(0)").val();
					if (n!=null&&n!=""){
						a=true;
					}else {
						$('#category').html("请选择！").css("color","red");
					}
					return a;
				}
			</script>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 esaybuy All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
