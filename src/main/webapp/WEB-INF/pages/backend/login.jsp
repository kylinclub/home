<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="./../dist/hp/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="./../dist/hp/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="./../dist/hp/css/animate.css" rel="stylesheet">
    <link href="./../dist/hp/css/style.css?v=2.2.0" rel="stylesheet">
    <title>管理后台登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
</head>
<body class="gray-bg">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="middle-box text-center loginscreen  animated fadeInDown">
	<div>
		<h3>欢迎使用</h3>
		<form class="m-t" role="form" action="logon" method="post">
			<c:if test="${msg!=null }">
				<div class="alert alert-danger">
				${msg}
				</div>
			</c:if>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="用户名" required="" id="username" name="username">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="密码" required="" id="password" name="password">
			</div>
			<button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
		</form>
	</div>
</div>
	<script src="./../dist/hp/js/jquery-2.1.1.min.js"></script>
    <script src="./../dist/hp/js/bootstrap.min.js?v=3.4.0"></script>
</body>
</html>