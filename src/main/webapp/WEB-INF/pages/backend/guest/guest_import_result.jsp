<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/header.jsp"%>
<style>
.laydate_box *{
	box-sizing:content-box;
}
.tips{
	font-size: 15px;
	margin-top: 10px;
}
.tips .important{
	font-weight: bolder;
	color:#ff0000;
}
.old{background-color:#FDD ;}
.new{background-color:#CFD ;}
</style>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
			<h2>导入${type==1?'大会主席团':'专家顾问团' }</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a href="guest_list">${type==1?'大会主席团':'专家顾问团' }</a></li>
                <li><a>导入结果</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInDown">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>导入了${count }条记录</h5>
					</div>
					<div class="ibox-content">
						<table class="table table-bordered">
							<tr><th>姓名</th><th>公司·职务</th></tr>
							<c:forEach var="person" items="${guests }">
								<tr>
									<td>${person.name }</td>
									<td>${person.company } · ${person.job }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script>
        $().ready(function () {
        	$("#guest${type}").addClass("active");
        	$("#confrence").addClass("active");
        	$("#guest${type}").parent().addClass("in")
        });
	</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>