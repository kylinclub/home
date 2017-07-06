<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/header.jsp"%>
<style>
.schedule{
	width:200px;
	padding-left: 15px;
    padding-right: 15px;
    position: relative;
    float:left;
}

.schedule .panel-body{
	text-align: center;
}
.schedule .panel-footer{
	padding: 5px;
	text-align: center;
}
.schedule .panel-footer a:nth-child(n+2){
	margin-left: 20px;
}
.schedule .name{
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
			<h2>大会议程列表</h2>
			<ol class="breadcrumb">
				<li><a href="index.html">首页</a></li>
                <li><a>大会议程</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12 tools">
			<!-- 
				<a class="btn btn-w-m btn-primary" href="add_schedule.html">新增</a>-->
				<a class="btn btn-w-m btn-info" href="import_schedule.html">导入</a>
			</div>
			<!--  
			<div class="col-lg-6 about">
				<span class="text-info">
					★ 默认按照姓名拼音升序排列
            	</span>
			</div>
			-->
			<div class="col-lg-12">
				<table class="table table-bordered" style="background-color: #fff">
					<thead>
						<tr>
							<th>会场</th>
                            <th>时间</th>
                            <th>日期</th>
                            <th>主题</th>
                            <th>嘉宾</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="s" items="${schedules }">
						 <tr>
						 	<td>${s.regin_name }</td>
						 	<td>${s.date_str }</td>
						 	<td>${s.time_str }</td>
						 	<td>${s.title }</td>
						 	<td>${s.name} ${s.company} ${s.job }</td>
						 </tr>
						</c:forEach>
                    </tbody>    
				</table>
			</div>
		</div>
	</div>
<script>
function del(sid){
	layer.confirm('确认删除该条记录?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
    	    url: "delete_schedule",
    	    data: "id="+sid,
    	    cache: false,
    	    type: "get",
    	    dataType: "json",
    	    timeout: 10000,
    	    complete: function(XMLResponse, status) {
    	        var data = $.parseJSON(XMLResponse.responseText);
    	        if(data.code==200){
    	        	$("#schedule"+sid).remove();
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
	$("#schedule").addClass("active");
	$("#confrence").addClass("active");
	$("#schedule").parent().addClass("in")
	
	$(".update-redis").click(function(){
		var index = layer.msg('正在更新缓存，请稍候...', {icon: 16,shade: [0.1,'#000'],time:0});
		$.ajax({
    	    url: "refresh",
    	    data: "type=schedule",
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