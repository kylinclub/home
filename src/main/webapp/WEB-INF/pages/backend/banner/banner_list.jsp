<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/header.jsp"%>
<style>
.speaker{
	width:200px;
	padding-left: 15px;
    padding-right: 15px;
    position: relative;
    float:left;
}

.speaker img{
	width: 112px;
	height: 112px;
}
.speaker .panel-body{
	text-align: center;
}
.speaker .panel-footer{
	padding: 5px;
	text-align: center;
}
.speaker .panel-footer a:nth-child(n+2){
	margin-left: 20px;
}
.speaker .name{
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
			<h2>banner列表</h2>
			<ol class="breadcrumb">
				<li><a href="/admin/index">首页</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12 tools">
				<a class="btn btn-w-m btn-primary" href="add_banner">新增</a>
			</div>
			<div class="col-lg-12 contents">
				<div class="ibox float-e-margins">
					<div class="ibox-content row">
						<table class="table table-bordered">
							<tr><th>图片</th><th>URL</th><th>操作</th></tr>
							<c:forEach var="banner" items="${banners}">
								<tr id="banner${banner.id}">
									<td>
										<img src="..${banner.image }" height="50">
									</td>
									<td>${banner.url}</td>
									<td>
										<a href="edit_banner?id=${banner.id}">编辑</a>&nbsp;
										<a href="javascript:void(0)" onclick="del(${banner.id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
function del(sid){
	layer.confirm('确认删除该条记录?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
    	    url: "delete_banner",
    	    data: "id="+sid,
    	    cache: false,
    	    type: "get",
    	    dataType: "json",
    	    timeout: 10000,
    	    complete: function(XMLResponse, status) {
    	        var data = $.parseJSON(XMLResponse.responseText);
    	        if(data.code==200){
    	        	$("#banner"+sid).remove();
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
	$("#opt").addClass("active");
	$("#confrence").addClass("active");
	$("#opt").parent().addClass("in")
	
	$(".update-redis").click(function(){
		var index = layer.msg('正在更新缓存，请稍候...', {icon: 16,shade: [0.1,'#000'],time:0});
		$.ajax({
    	    url: "refresh",
    	    data: "type=speaker",
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