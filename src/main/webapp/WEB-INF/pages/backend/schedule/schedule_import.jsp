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
.form-horizontal .control-label{width: 150px;}
</style>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
			<h2>导入大会议程</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a href="schedule_list">大会议程</a></li>
                <li><a>导入大会议程</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInDown">
		<div class="row">
			<div class="col-lg-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>导入excel，请注意右侧的说明文字</h5>
					</div>
					<div class="ibox-content">
						<form action="schedule_import" class="form-horizontal m-t" id="commentForm" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">上传excel文件：</label>
								<div class="col-sm-3">
									<input type="file"  name="file" accept=".xls">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<button class="btn btn-primary" type="submit">提交保存</button>
									<a class="btn btn-default" href="schedule_list">返回列表</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="alert alert-warning">
					<span class="alert-link" style="font-size: 20px;padding-left:25px;">注意事项：</span>
					<br>
					<ol class="tips">
						<li>1.只支持导入后缀为.xls的excel文件</li>
						<li>2.会完全覆盖原有数据</li>
						<li>3.<a href="../xls/schedule.xls">点击下载</a>模板</li>
					</ol>
					<span class="alert-link" style="font-size: 20px;padding-left:25px;">模板文件字段说明如下：</span>
					<br>
					<ol class="tips">
						<li>“会场”列请填写数字，对应关系为：1对应主会场，2对应云专场，3对应运维专场，4对应大数据专场，5对应技术&产品专场</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
    <script>

        $().ready(function () {
        	$("#schedule").addClass("active");
        	$("#confrence").addClass("active");
        	$("#schedule").parent().addClass("in")
        });
	</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>