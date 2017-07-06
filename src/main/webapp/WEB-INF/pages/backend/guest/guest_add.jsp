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
			<h2>${guest.id==null?"新增":"编辑" }${guest.type==1?'大会主席团':'专家顾问团' }成员</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a href="guest_list">${guest.type==1?'大会主席团':'专家顾问团' }</a></li>
                <li><a>${guest.id==null?"新增":"编辑" }</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInDown">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>填写特邀嘉宾成员资料，请注意右侧说明</h5>
					</div>
					<div class="ibox-content">
						<form action="save_guest" class="form-horizontal m-t" id="commentForm" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-8">
									<input id="cname" name="guest.name" minlength="2" type="text"
										class="form-control" required="" aria-required="true" value="${guest.name }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名拼音（小写）：</label>
								<div class="col-sm-8">
									<input id="cusername" name="guest.username" minlength="2" type="text"
										class="form-control" required="" aria-required="true" value="${guest.username }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">公司：</label>
								<div class="col-sm-8">
									<input id="ccompany" type="text" class="form-control"
										name="guest.company" required="" aria-required="true" value="${guest.company }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">职位：</label>
								<div class="col-sm-8">
									<input id="cjob" type="text" class="form-control"
										name="guest.job" required="" aria-required="true" value="${guest.job }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">头像：</label>
								<div class="col-sm-3">
									<input type="file"  name="image">
								</div>
								<c:if test="${guest.image!=null }">
									<div class="col-sm-6">
										<span class="text-danger">头像已上传，如果不需要修改，无需再次上传</span>
									</div>
								</c:if>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">个人简介：</label>
								<div class="col-sm-8">
									<textarea name="guest.sumarry" class="form-control"
										required="" aria-required="true">${guest.sumarry }</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<input type="hidden" name="guest.id" value="${guest.id }">
									<input type="hidden" name="guest.type" value="${guest.type }">
									<input type="hidden" name="guest.image" value="${guest.image }">
									<button class="btn btn-primary" type="submit">提交保存</button>
									<a class="btn btn-default" href="guest_list">返回列表</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="alert alert-warning">
					<span class="alert-link" style="font-size: 20px;padding-left:25px;">注意事项：</span>
					<br>
					<ol class="tips">
						<li>本页所有字段都是必填字段，需要说明的是，如果是在编辑成员信息，那么可以不重新上传头像</li>
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
            
            $("#guest${guest.type}").addClass("active");
        	$("#confrence").addClass("active");
        	$("#guest${guest.type}").parent().addClass("in")
        });
	</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>