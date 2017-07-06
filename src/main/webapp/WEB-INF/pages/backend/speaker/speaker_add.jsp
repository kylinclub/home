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
			<h2>${speaker.id==null?"新增":"编辑" }演讲嘉宾</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a href="speaker_list">演讲嘉宾</a></li>
                <li><a>${speaker.id==null?"新增":"编辑" }演讲嘉宾</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInDown">
		<div class="row">
			<div class="col-lg-8">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>填写演讲嘉宾资料，请注意右侧的说明文字</h5>
					</div>
					<div class="ibox-content">
						<form action="save_speaker" class="form-horizontal m-t" id="commentForm" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-8">
									<input id="cname" name="speaker.name" minlength="2" type="text"
										class="form-control" required="" aria-required="true" value="${speaker.name }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名拼音（小写）：</label>
								<div class="col-sm-8">
									<input id="cusername" name="speaker.username" minlength="2" type="text"
										class="form-control" required="" aria-required="true" value="${speaker.username }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">公司：</label>
								<div class="col-sm-8">
									<input id="ccompany" type="text" class="form-control"
										name="speaker.company" required="" aria-required="true" value="${speaker.company }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">职位：</label>
								<div class="col-sm-8">
									<input id="cjob" type="text" class="form-control"
										name="speaker.job" required="" aria-required="true" value="${speaker.job }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">头像：</label>
								<div class="col-sm-3">
									<input type="file"  name="image">
								</div>
								<c:if test="${speaker.image!=null }">
									<div class="col-sm-6">
										<span class="text-danger">头像已上传，如果不需要修改，无需再次上传</span>
									</div>
								</c:if>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">个人简介：</label>
								<div class="col-sm-8">
									<textarea name="speaker.sumarry" class="form-control"
										required="" aria-required="true">${speaker.sumarry }</textarea>
								</div>
							</div>
							<!--  
							<div class="form-group">
								<label class="col-sm-3 control-label">所属会场：</label>
								<div class="col-sm-8">
									<select name="speaker.region_id" id="scid" class="form-control mb"
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
									<textarea name="speaker.title" class="form-control"
										required="" aria-required="true">${speaker.title}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">演讲主题简介：</label>
								<div class="col-sm-8">
									<textarea name="speaker.content" class="form-control"
										required="" aria-required="true" >${speaker.content }</textarea>
								</div>
							</div>
							-->
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<input type="hidden" name="speaker.id" value="${speaker.id }">
									<input type="hidden" name="speaker.image" value="${speaker.image }">
									<button class="btn btn-primary" type="submit">提交保存</button>
									<a class="btn btn-default" href="speaker_list">返回列表</a>
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
						<li>本页所有字段都是必填字段，需要说明的是，如果是在编辑嘉宾信息，那么可以不重新上传嘉宾头像</li>
						<li>姓名拼音字段务必正确填写，最终列表显示页是按照该字段升序排列的</li>
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
            
            $("#scid").val(${speaker.region_id });
            $("#speaker").addClass("active");
        	$("#confrence").addClass("active");
        	$("#speaker").parent().addClass("in")
        });
	</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>