<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../dist/hp/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
<link href="../dist/hp/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
<link href="../dist/hp/css/plugins/select2/select2.css" rel="stylesheet">
<link href="../dist/hp/css/animate.css" rel="stylesheet">
<link href="../dist/hp/css/style.css?v=2.2.0" rel="stylesheet">
<link href="../dist/hp/css/bui/dpl.css" rel="stylesheet" type="text/css" />
<link href="../dist/hp/css/bui/bui.css" rel="stylesheet" type="text/css" />
<link href="../dist/hp/css/bui/page-min.css" rel="stylesheet" type="text/css" />
<link href="../dist/hp/css/app.css" rel="stylesheet">
<link href="../dist/hp/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="../dist/hp/css/plugins/msgbox/msgbox.css" rel="stylesheet">
<link href="../dist/hp/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="../dist/hp/css/sui/label.css" rel="stylesheet">
<script src="../dist/hp/js/jquery-2.1.1.min.js"></script>
<script src="../dist/hp/js/bootstrap.min.js?v=3.4.0"></script>
<script src="../dist/hp/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../dist/hp/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../dist/hp/js/hplus.js?v=2.2.0"></script>
<script src="../dist/hp/js/plugins/pace/pace.min.js"></script>
<script src="../dist/hp/js/layer/layer.js"></script>
<script src="../dist/hp/js/layer/extend/layer.ext.js"></script>
<script src="../dist/hp/js/laydate/laydate.js"></script>
<script src="../dist/hp/js/plugins/select2/select2.min.js"></script>
<script src="../dist/hp/js/bui/bui.js"></script>
<script src="../dist/hp/js/bui/config.js"></script>
<script src="../dist/hp/js/jquery.shake.js"></script>
<script src="../dist/hp/js/plugins/iCheck/icheck.min.js"></script>
<script src="../dist/hp/js/plugins/msgbox/msgbox.js"></script>
<script src="../dist/hp/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="../dist/hp/js/util.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>GITC官网后台</title>
<script>
window.onerror=function(){layer.alert('JS加载出错', {title:'js error',icon: 2});}
</script>
</head>
<body>
<nav class="navbar navbar-static-top it-nav" role="navigation" style="margin-bottom: 0">
	<a class="navbar-brand it-nav-brand" style="font-size: 20px;">GITC官网后台</a>
</nav>
<div id="wrapper">
	<nav class="navbar-default navbar-static-side it-nav-fix" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span> <img alt="image"src="../dist/img/kylin_logo2.png"/> </span>
					</div>
				</li>
				<!--
				<li id="index">
					<a href="/admin/index.html"><i class="fa fa-home"></i> <span class="nav-label">首页管理</span></a>
				</li>
				<li id="confrences">
					<a href="/admin/confrences.html"><i class="fa fa-gear"></i> <span class="nav-label">会议管理</span></a>
				</li>
				-->
				<li id="confrence">
					<a><i class="fa fa-gears"></i><span class="nav-label"> 会议内容管理</span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse">
						<!--  <li id="schedule">
							<a href="/admin/schedule_list.html">议程管理</a>
						</li>-->
						<li id="guest1">
							<a href="guest_list?type=1">大会主席团管理</a>
						</li>
						<li id="guest0">
							<a href="guest_list?type=0">专家顾问团管理</a>
						</li>
						<li id="speaker">
							<a href="speaker_list">演讲嘉宾管理</a>
						</li>
						<li id="opt">
							<a href="banner_list">首页滚动图片管理</a>
						</li>
					</ul>
				</li>
				<li id="sh">
					<a><i class="fa fa-gears"></i><span class="nav-label"> 上海站</span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse">
						<li id="user0">
							<a href="user_list?type=0">特邀嘉宾管理</a>
						</li>
						<li id="user1">
							<a href="user_list?type=1">演讲嘉宾管理</a>
						</li>
					</ul>
				</li>
				<li id="contact">
                	<a><i class="fa fa-gears"></i><span class="nav-label"> 其他管理</span><span class="fa arrow"></span></a>
                			<ul class="nav nav-second-level collapse">
                					<li id="user1">
                							<a href="contact_list">加入我们管理</a>
                					</li>
                			</ul>
                </li>
			</ul>
		</div>
		<div class="navbar-header it-nav-tool">
			<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="javascript:void(0)"><i class="fa fa-bars"> </i> </a>
        </div>
	</nav>
<div id="page-wrapper" class="gray-bg dashbard-1">