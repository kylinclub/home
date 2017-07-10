<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/header.jsp"%>

<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
			<h2>加入我们列表</h2>
			<ol class="breadcrumb">
				<li><a href="/admin/index">首页</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12 contents">
				<div class="ibox float-e-margins">
					<div class="ibox-content row">
						<table class="table table-bordered">
							<tr>
							<th>姓名</th><th>电话</th><th>邮件</th>
							<th>公司</th><th>部门</th><th>职位</th>
							<th>兴趣</th><th>其他兴趣</th><th>建议</th>
							<th>日期</th><th>操作</th>
							</tr>
							<c:forEach var="contact" items="${contacts}">
								<tr id="contact${contact.id}">
								    <td>${contact.name}</td><td>${contact.tel}</td><td>${contact.email}</td>
									<td>${contact.company}</td><td>${contact.department}</td><td>${contact.position}</td>
									<td>${contact.interest}</td><td>${contact.interest_other}</td><td>${contact.suggest}</td>
								    <td>${contact.add_time}</td><td><a href="javascript:void(0)" onclick="del(${contact.id})">删除</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
function del(id){
	layer.confirm('确认删除该条记录?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
    	    url: "delete_contact",
    	    data: "id="+id,
    	    cache: false,
    	    type: "get",
    	    dataType: "json",
    	    timeout: 10000,
    	    complete: function(XMLResponse, status) {
    	        var data = $.parseJSON(XMLResponse.responseText);
    	        if(data.code==200){
    	        	$("#contact"+id).remove();
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
</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>