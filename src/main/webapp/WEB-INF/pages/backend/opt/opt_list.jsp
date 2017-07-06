<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/header.jsp"%>
<style>
.ibox-content{
	background-color: transparent;
}
.person{
	width:380px;
	padding-left: 15px;
    padding-right: 15px;
    position: relative;
    float:left;
}

.person img{
	width:320px;
}
.person .panel-body{
	text-align: center;
}
.person .panel-footer{
	padding: 5px;
	text-align: center;
}
.person .panel-footer a:nth-child(n+2){
	margin-left: 20px;
}
.person .name{
	padding: 5px;
	text-align: center;
}
.tools{
	margin-bottom: 20px;
}
.contents{
	margin-left: 15px;
}
.contents .ibox-content{
	padding-left: 0;
	margin-right: 15px;
}
.about{
	margin-bottom: 0;
	margin-top: 20px;
	text-align: right;
}
</style>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
			<h2>其他信息管理</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a>合作伙伴&媒体&参会指南</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-4">
				<div class="ibox float-e-margins">
					<div class="ibox-content row">
						<div class="person">
							<div class="panel panel-default">
								<div class="panel-heading name"><a href="edit_opt?id=${sponsor.id}">编辑合作伙伴</a></div>
								<div class="panel-body"><img src="${sponsor.image}"></div>
							</div>
						 </div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="ibox-content row">
					<div class="person">
						<div class="panel panel-default">
							<div class="panel-heading name"><a href="edit_opt?id=${media.id}">编辑合作媒体</a></div>
							<div class="panel-body"><img src="${media.image}"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="ibox-content row">
					<div class="person">
						<div class="panel panel-default">
							<div class="panel-heading name"><a href="edit_opt?id=${guide.id}">编辑参会指南</a></div>
							<div class="panel-body"><img src="${guide.image}"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$("#opt").addClass("active");
$("#confrence").addClass("active");
$("#opt").parent().addClass("in")
</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>