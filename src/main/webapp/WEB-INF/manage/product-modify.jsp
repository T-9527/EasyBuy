<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
	<link type="text/css" rel="stylesheet" href="../../resources/css/style.css" />
	<script type="text/javascript" src="../../resources/scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../resources/scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../../resources/images/logo.gif" /></div>
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
		<h2>修改商品</h2>
		<div class="manage">
			<form action="/product/update" method="post" enctype="multipart/form-data" onsubmit="return fun();">
				<table class="form">
					<tr>
						<td class="field">商品名称(*)：</td>
						<td><input type="text" class="text" name="p_name" value="${product.p_name}" /></td>
					</tr>
                    <tr>
						<td class="field">描述：</td>
						<td><input type="text" class="text" name="discription" value="${product.discription}" /></td>
					</tr>
					<tr>
						<td class="field">所属分类：</td>
						<td>
							<select name="pro_category.name">
								<c:forEach items="${list}" var="i">
								<option value="${i.name}">${i.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>					
					<tr>
						<td class="field">商品价格(*)：</td>
						<td><input type="text" class="text_tiny" name="price" value="${product.price}"/> 元</td>
					</tr>
					
					<tr>
						<td class="field">库存(*)：</td>
						<td><input type="text" class="text_tiny" name="stock" value="${product.stock}"/></td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><input type="file" class="text" name="photo"/>
							<input type="hidden" name="id" value="${product.id}">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="确定" /></label></td>
					</tr>
				</table>
                <h3 style="margin-left: 100px;color: red;"></h3>
			</form>
		</div>
	</div>
    <script>
        var i = $(".text:eq(0)").val();
        var i1 = $(".text:eq(1)").val();
        var i2 = $(".text:eq(2)").val();

        var t = $(".text_tiny:eq(0)").val();
        var t1 = $(".text_tiny:eq(1)").val();
        var a = false;
        function fun() {

            if(i!=null&&i!="" && i1!=null&&i1!="" && i2!=null&&i2!=""
            && t!=null&&t!="" && t1!=null&&t1!=""){
                a=true;
            }else {
                a=false;
                $('h3').html("所有输入框都不能为空!");
            }
            return a;
        }
    </script>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 esaybuy All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
