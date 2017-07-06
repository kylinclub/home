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
			<h2>${schedule.id==null?"新增":"编辑" }大会议程</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a href="schedule_list">大会议程</a></li>
                <li><a>${schedule.id==null?"新增":"编辑" }大会议程</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInDown">
		<div class="row">
			<div class="col-lg-8">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>填写大会议程资料，请注意右侧的说明文字</h5>
					</div>
					<div class="ibox-content">
						<form action="save_schedule" class="form-horizontal m-t" id="commentForm" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-8">
									<input id="cname" name="schedule.name" minlength="2" type="text"
										class="form-control" required="" aria-required="true" value="${schedule.name }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">公司：</label>
								<div class="col-sm-8">
									<input id="ccompany" type="text" class="form-control"
										name="schedule.company" required="" aria-required="true" value="${schedule.company }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">职位：</label>
								<div class="col-sm-8">
									<input id="cjob" type="text" class="form-control"
										name="schedule.job" required="" aria-required="true" value="${schedule.job }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">所属会场：</label>
								<div class="col-sm-8">
									<select name="schedule.regin_id" id="scid" class="form-control mb"
										required="" aria-required="true">
									<option>请选择</option>
									<option value="1">主会场</option>
									<option value="2">云专场</option>
									<option value="3">运维专场</option>
									<option value="4">大数据专场</option>
									<option value="5">技术&产品专场</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">演讲主题：</label>
								<div class="col-sm-8">
									<textarea name="schedule.title" class="form-control"
										required="" aria-required="true">${schedule.title}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">演讲日期：</label>
								<div class="col-sm-8">
									<textarea name="schedule.date_str" class="form-control"
										required="" aria-required="true" >${schedule.date_str }</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">演讲时间：</label>
								<div class="col-sm-8">
									<textarea name="schedule.time_str" class="form-control"
										required="" aria-required="true" >${schedule.time_str }</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<input type="hidden" name="schedule.id" value="${schedule.id }">
									<button class="btn btn-primary" type="submit">提交保存</button>
									<a class="btn btn-default" href="schedule_list">返回列表</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="alert alert-warning">
					<span class="alert-link" style="font-size: 20px;padding-left:25px;">注意事项：</span>
					<br>
					<ol class="tips">
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery Validation plugin javascript-->
    <script src="../dist/hp/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="../dist/hp/js/plugins/validate/messages_zh.min.js"></script>
    <script>
        $.validator.setDefaults({
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            success: function (element) {
                element.closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            errorElement: "span",
            errorClass: "help-block m-b-none",
            validClass: "help-block m-b-none"
        });

        $().ready(function () {
            $("#commentForm").validate();
            
            $("#scid").val(${schedule.regin_id });
            $("#schedule").addClass("active");
        	$("#confrence").addClass("active");
        	$("#schedule").parent().addClass("in")
        });
	</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>