<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/header.jsp"%>
<style>
.person{
	width:200px;
	padding-left: 15px;
    padding-right: 15px;
    position: relative;
    float:left;
}

.person img{
	width: 112px;
	height: 112px;
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
			<h2>${type==1?"大会主席团":"专家顾问团" }</h2>
			<ol class="breadcrumb">
				<li><a href="/admin/index">首页</a></li>
                <li><a>${type==1?"大会主席团":"专家顾问团" }</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-6 tools">
			<!--  
				<a class="btn btn-w-m btn-primary" href="add_person?type=${type }">新增</a>
			-->
				<a class="btn btn-w-m btn-primary" href="add_guest?type=${type}">新增</a>
				<a class="btn btn-w-m btn-info" href="import_guest?type=${type}">导入</a>
			</div>
			<div class="col-lg-6 about">
				<span class="text-info">
					★ 默认按照姓名拼音升序排列
            	</span>
			</div>
			<div class="col-lg-12 contents">
				<div class="ibox float-e-margins">
					<div class="ibox-content row">
						<c:forEach var="s" items="${guests }">
						 <div class="person" id="person${s.id }">
							<div class="panel panel-default">
								<div class="panel-heading name">${s.name} <br> ${s.company }</div>
								<div class="panel-body"><img src="..${s.image}"></div>
								<div class="panel-footer">
									<a href="edit_guest?id=${s.id}">编辑</a>
									<a href="javascript:void(0)" onclick="del(${s.id})">删除</a>
								</div>
							</div>
						 </div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
function del(sid){
	layer.confirm('确认删除该条记录?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
    	    url: "delete_guest",
    	    data: "id="+sid,
    	    cache: false,
    	    type: "get",
    	    dataType: "json",
    	    timeout: 10000,
    	    complete: function(XMLResponse, status) {
    	        var data = $.parseJSON(XMLResponse.responseText);
    	        if(data.code==200){
    	        	$("#person"+sid).remove();
    	        	layer.msg('删除成功',{time: 1000});
    	        	layer.close(index);
    	        }else{
    	        	layer.msg('删除失败', {icon: 5});
    	        	layer.close(index);
    	        }
    	    }
    	})
	});
}
$().ready(function () {
	$("#guest${type}").addClass("active");
	$("#confrence").addClass("active");
	$("#guest${type}").parent().addClass("in")
	
	$(".update-redis").click(function(){
		var index = layer.msg('正在更新缓存，请稍候...', {icon: 16,shade: [0.1,'#000'],time:0});
		$.ajax({
    	    url: "refresh",
    	    data: "type=guest",
    	    cache: false,
    	    type: "get",
    	    dataType: "json",
    	    timeout: 10000,
    	    complete: function(XMLResponse, status) {
    	        var data = $.parseJSON(XMLResponse.responseText);
    	        if(data.code==200){
    	        	layer.msg('缓存更新成功',{time: 1000});
    	        	layer.close(index);
    	        }else{
    	        	layer.msg('更新失败', {icon: 5});
    	        	layer.close(index);
    	        }
    	    }
    	})
	})
});
</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>